#!/bin/bash
#
# Harvest data by running data downloads processes each day.
# - TODO smalers 2021-04-21 this works for Steve Malers' dev machine and needs to be generalized

# Supporting functions, alphabetized.

# Determine the aws script
# - figures out the location of the 'aws' script for Cygwin and MinGW (Git Bash)
checkAws() {
  if [ -z "${operatingSystem}" ]; then
    logError "Operating system has not been set.  Need to fix script."
    exit 1
  elif [ "${operatingSystem}" = "cygwin" -o "${operatingSystem}" = "linux" ]; then
    # Assume that 'aws' is in a standard location such as /usr/bin/aws
    awsScript="aws"
  elif [ "${operatingSystem}" = "mingw" ]; then
    # For Windows Python 3.7, aws may be installed in Windows %USERPROFILE%\AppData\Local\Programs\Python\Python37\scripts
    # - use Linux-like path to avoid backslash issues
    # - TODO smalers 2019-01-04 could try to find if the script is in the PATH
    # - TODO smalers 2019-01-04 could try to find where py thinks Python is installed but not sure how
    awsScript="${HOME}/AppData/Local/Programs/Python/Python37/scripts/aws"
    if [ ! -f "${awsScript}" ]; then
      logError ""
      logError "Can't find 'aws' script"
      exit 1
    fi
  else
    logError ""
    logError "Don't know how to run on operating system ${operatingSystem}"
    exit 1
  fi
  logInfo "aws script is: ${awsScript}"
}

# Determine the operating system that is running the script
# - mainly care whether Cygwin or MINGW (Git Bash)
checkOperatingSystem() {
  if [ ! -z "${operatingSystem}" ]; then
    # Have already checked operating system so return
    return
  fi
  operatingSystem="unknown"
  os=$(uname | tr [a-z] [A-Z])
  case "${os}" in
    CYGWIN*)
      operatingSystem="cygwin"
      ;;
    LINUX*)
      operatingSystem="linux"
      ;;
    MINGW*)
      operatingSystem="mingw"
      ;;
  esac
}

# Echo to stderr
# - if necessary, quote the string to be printed
# - this function is called to print various message types
echoStderr() {
  echo "$@" 1>&2
}

# Get the InfoMapper version and Poudre Information Portal version.
# - the version is in the 'web/app-config.json' file in format:  "version": "0.7.0.dev (2020-04-24)"
# - the Info Mapper software version in 'assets/version.json' with format similar to above
# - set variables ${appVersion} and ${infoMapperVersion}
getVersion() {
  # Application version
  if [ ! -f "${appConfigFile}" ]; then
    logError "Application version file does not exist: ${appConfigFile}"
    logError "Exiting."
    exit 1
  fi
  appVersion=$(grep '"version":' ${appConfigFile} | cut -d ":" -f 2 | cut -d "(" -f 1 | tr -d '"' | tr -d ' ' | tr -d ',')
  # InfoMapper version
  infoMapperVersionFile="${infoMapperMainFolder}/src/assets/version.json"
  if [ ! -f "${infoMapperVersionFile}" ]; then
    logError "InfoMapper version file does not exist: ${infoMapperVersionFile}"
    logError "Exiting."
    exit 1
  fi
  infoMapperVersion=$(grep '"version":' ${infoMapperVersionFile} | cut -d ":" -f 2 | cut -d "(" -f 1 | tr -d '"' | tr -d ' ' | tr -d ',')
}

# Harvest the current US Drought Monitor layer.
harvestDroughtMonitor() {
  local droughtMonitorFile exitStatus s3DroughtMonitorFolder

  s3DroughtMonitorFolder="${s3BucketUrl}/US/USDM"

  gpCommandFiles=(
    ${workflowFolder}/CurrentConditions/WaterSupply-Drought/01a-download-dm-current.gp
  )

  for gpCommandFile in ${gpCommandFiles}; do
    logInfo "Running GeoProcessor command file: ${gpCommandFile}"
    if [ ! -f "${gpCommandFile}" ]; then
      logWarning "Command file does not exist (skipping):  ${gpCommandFile}"
      continue
    fi
    # cmd //C ${gpExe} /h
    # TODO smalers 2021-10-15 For some reason cmd is no longer found in the path.
    #cmd //C ${gpExe} //s3.10 --commands ${gpCommandFile}
    /C/Windows/System32/cmd //C ${gpExe} //s3.10 --commands ${gpCommandFile}
    exitStatus=$?
    logInfo "Exit status from GeoProcessor cmd is ${exitStatus}."
    if [ "${exitStatus}" -ne 0 ]; then
      return ${exitStatus}
    fi
  done

  # Copy the resulting layer file to OWF cloud data.

  droughtMonitorFile="${workflowFolder}/CurrentConditions/WaterSupply-Drought/layers/USDM_current_M.geojson"
  if [ ! -f "${droughtMonitorFile}" ]; then
    logError "Drought monitor file does not exist: ${droughtMonitorFile}"
  fi
  logInfo "Copy US drought monitor file:"
  logInfo "  from: ${droughtMonitorFile}"
  logInfo "    to: ${s3DroughtMonitorFolder}/USDM_current_M.geojson"
  ${awsScript} s3 cp ${droughtMonitorFile} ${s3DroughtMonitorFolder}/USDM_current_M.geojson ${dryrun} --profile ${awsProfile}
  if [ $? -eq 0 ]; then
    return 0
  else
    return 1
  fi
}

# Harvest the SNODAS layer.
harvestSnodas() {
  local exitStatus snodasFile s3DroughtMonitorFolder

  s3CdssFolder="${s3BucketUrl}/CO/CDSS"
  s3SnodasFolder="${s3CdssFolder}/SNODAS"

  gpCommandFiles=(
    ${workflowFolder}/CurrentConditions/WaterSupply-Snowpack/01a-download-snodas-latest.gp
  )

  for gpCommandFile in ${gpCommandFiles}; do
    logInfo "Running GeoProcessor command file: ${gpCommandFile}"
    if [ ! -f "${gpCommandFile}" ]; then
      logWarning "Command file does not exist (skipping):  ${gpCommandFile}"
      continue
    fi
    # cmd //C ${gpExe} /h
    # TODO smalers 2021-10-15 For some reason cmd is no longer found in the path.
    #cmd //C ${gpExe} //s3.10 --commands ${gpCommandFile}
    /C/Windows/System32/cmd //C ${gpExe} //s3.10 --commands ${gpCommandFile}
    exitStatus=$?
    logInfo "Exit status from GeoProcessor cmd is ${exitStatus}."
    if [ "${exitStatus}" -ne 0 ]; then
      return ${exitStatus}
    fi
  done

  # Manually copy the resulting layer file to infomapper files.
  # - copying only to src/assets does not result in upload because --nobuild does not recreate dist
  # - have to copy to dist manually so that AWS sync will see the new file

  #echo "Copy the snodas.geojson file to: ${srcCurrentConditionsFolder}/WaterSupply-Snowpack/layers/snodas.geojson"
  #cp ${workflowFolder}/CurrentConditions/WaterSupply-Snowpack/layers/snodas.geojson ${srcCurrentConditionsFolder}/WaterSupply-Snowpack/layers/snodas.geojson
  #echo "Copy the snodas.geojson file to: ${assetsCurrentConditionsFolder}/WaterSupply-Snowpack/layers/snodas.geojson"
  #cp ${workflowFolder}/CurrentConditions/WaterSupply-Snowpack/layers/snodas.geojson ${distCurrentConditionsFolder}/WaterSupply-Snowpack/layers/snodas.geojson
  #logInfo "Copy the SnowpackStatisticsByDate_LatestDate.geojson file to: ${s3SnodasFolder}/SnowpackStatisticsByDate_LatestDate.geojson"

  # Copy the resulting layer file to OWF cloud data.

  snodasFile="${workflowFolder}/CurrentConditions/WaterSupply-Snowpack/layers/SnowpackStatisticsByDate_LatestDate.geojson"
  if [ ! -f "${snodasFile}" ]; then
    logError "SNODAS file does not exist: ${snodasFile}"
  fi
  logInfo "Copy US SNODAS file:"
  logInfo "  from: ${snodasFile}"
  logInfo "    to: ${s3SnodasFolder}/SnowpackStatisticsByDate_LatestDate.geojson"
  ${awsScript} s3 cp ${snodasFile} ${s3SnodasFolder}/SnowpackStatisticsByDate_LatestDate.geojson ${dryrun} --profile ${awsProfile}
  if [ $? -eq 0 ]; then
    return 0
  else
    return 1
  fi
}

# Print a DEBUG message, currently prints to stderr.
logDebug() {
   echoStderr "[DEBUG] $@"
}

# Print an ERROR message, currently prints to stderr.
logError() {
   echoStderr "[ERROR] $@"
}

# Print an INFO message, currently prints to stderr.
logInfo() {
   echoStderr "[INFO] $@"
}

# Print an WARNING message, currently prints to stderr.
logWarning() {
   echoStderr "[WARNING] $@"
}

# Parse the command parameters
# - use the getopt command line program so long options can be handled
parseCommandLine() {
  # Single character options
  optstring="hv"
  # Long options
  optstringLong="aws-profile::,dryrun,help,version"
  # Parse the options using getopt command
  GETOPT_OUT=$(getopt --options ${optstring} --longoptions ${optstringLong} -- "$@")
  exitCode=$?
  if [ ${exitCode} -ne 0 ]; then
    # Error parsing the parameters such as unrecognized parameter
    echoStderr ""
    printUsage
    exit 1
  fi
  # The following constructs the command by concatenating arguments
  eval set -- "${GETOPT_OUT}"
  # Loop over the options
  while true; do
    #logDebug "Command line option is ${opt}"
    case "$1" in
      --aws-profile) # --aws-profile=profile  Specify the AWS profile (use default)
        case "$2" in
          "") # Nothing specified so error
            logError "--aws-profile=profile is missing profile name"
            exit 1
            ;;
          *) # profile has been specified
            awsProfile=$2
            shift 2
            ;;
        esac
        ;;
      --dryrun) # --dryrun  Indicate to AWS commands to do a dryrun but not actually upload.
        logInfo "--dryrun detected - will not change files on S3"
        dryrun="--dryrun"
        shift 1
        ;;
      -h|--help) # -h or --help  Print the program usage
        printUsage
        exit 0
        ;;
      -v|--version) # -v or --version  Print the program version
        printVersion
        exit 0
        ;;
      --) # No more arguments
        shift
        break
        ;;
      *) # Unknown option
        logError ""
        logError "Invalid option $1." >&2
        printUsage
        exit 1
        ;;
    esac
  done
}

# Print the program usage to stderr.
# - calling code must exit with appropriate code
printUsage() {
  echoStderr ""
  echoStderr "Usage:  ${programName} --aws-profile=profile"
  echoStderr ""
  echoStderr "Harvest data for the Poudre Information Portal application and save to the Amazon S3 static website folder(s),"
  echoStderr "using the AWS S3 cp command."
  echoStderr ""
  echoStderr "--aws-profile=profile   Specify the Amazon profile to use for AWS credentials."
  echoStderr "--dryrun                Do a dryrun but don't actually upload anything."
  echoStderr "-h or --help            Print the usage."
  echoStderr "-v or --version         Print the version and copyright/license notice."
  echoStderr ""
}

# Print the script version and copyright/license notices to stderr.
# - calling code must exit with appropriate code
printVersion() {
  echoStderr ""
  echoStderr "${programName} version ${programVersion} ${programVersionDate}"
  echoStderr ""
  echoStderr "OWF Data Harvester"
  echoStderr "Copyright 2017-2021 Open Water Foundation."
  echoStderr ""
  echoStderr "License GPLv3+:  GNU GPL version 3 or later"
  echoStderr ""
  echoStderr "There is ABSOLUTELY NO WARRANTY; for details see the"
  echoStderr "'Disclaimer of Warranty' section of the GPLv3 license in the LICENSE file."
  echoStderr "This is free software: you are free to change and redistribute it"
  echoStderr "under the conditions of the GPLv3 license in the LICENSE file."
  echoStderr ""
}

# Script entry point.

awsProfile=""
# Use the following to try a dry run
#dryrun="--dryrun"
dryrun=""

programName=$(basename $0)
programVersion="1.0.0"
programVersionDate="2021-04-25"

# Count of errors for the script.
errorCountTotal=0

# The script is in the Poudre Information Website folder.
scriptFolder=$(cd $(dirname "$0") && pwd)
repoFolder=$(dirname ${scriptFolder})
gitReposFolder=$(dirname ${repoFolder})
infomapperFolder=${gitReposFolder}/owf-app-infomapper-ng/infomapper
srcCurrentConditionsFolder=${infomapperFolder}/src/assets/app/data-maps/CurrentConditions
distCurrentConditionsFolder=${infomapperFolder}/dist/infomapper/assets/app/data-maps/CurrentConditions
workflowFolder=${repoFolder}/workflow

# Check the operating system
checkOperatingSystem

tstoolExe="/C/CDSS/TSTool-13.03.00dev"
gpExe="/C/Users/sam/owf-dev/GeoProcessor/git-repos/owf-app-geoprocessor-python/scripts/gpdev.bat"

# S3 folder for upload
# - put before parseCommandLine so can be used in print usage, etc.
# - TODO smalers 2020-04-20 does this need an app folder at end like "/owf-app-poudre-dashboard"?
# - for now don't copy to assets folder in cloud
#getVersion
#logInfo "Application version:  ${appVersion}"
#logInfo "InfoMapper version:   ${infoMapperVersion}"
s3BucketUrl="s3://data.openwaterfoundation.org"
s3FolderVersionUrl="s3://poudre.openwaterfoundation.org/${appVersion}"
s3FolderLatestUrl="s3://poudre.openwaterfoundation.org/latest"

# Parse the command line.
parseCommandLine "$@"

if [ -z ${awsProfile} ]; then
  logError "The AWS profile must be specified with --aws-profile."
  printUsage
  exit 1
fi

# Set the ${awsScript} to run
checkAws

# Check for input folder.
logInfo "CurrentConditions folder for deployed InfoMapper: ${srcCurrentConditionsFolder}"
if [ ! -d "${srcCurrentConditionsFolder}" ]; then
  logError "CurrentConditions folder does not exist:  ${srcCurrentConditionsFolder}"
  exit 1
fi

# Harvest the SNODAS GeoJSON
harvestSnodas
errorCountTotal=$((${errorCountTotal} + $?))

# Harvest the US Drought Monitor
harvestDroughtMonitor
errorCountTotal=$((${errorCountTotal} + $?))

# TODO smalers 2021-04-24 old code that can be removed if other harvest code works.
#echo "Copy the snodas.geojson file to: ${srcCurrentConditionsFolder}/Environment-Wildfires/layers/snodas.geojson"
#cp ${workflowFolder}/CurrentConditions/WaterSupply-Snowpack/layers/snodas.geojson ${srcCurrentConditionsFolder}/Environment-Wildfires/layers/snodas.geojson
#echo "Copy the snodas.geojson file to: ${assetsCurrentConditionsFolder}/Environment-Wildfires/layers/snodas.geojson"
#cp ${workflowFolder}/CurrentConditions/WaterSupply-Snowpack/layers/snodas.geojson ${distCurrentConditionsFolder}/Environment-Wildfires/layers/snodas.geojson

# Don't run the sync program here.
# - this can lead to problems because if someone else runs and uploads the Angular bundle files could be different
#   and cause a full upload again
# - because specific file locations are known, only copy the specific files
# - even running 'copy-to-owf-amazon-s3.sh --nobuild' could have unforeseen sync issues

# echo "Sync files to AWS S3"
#./copy-to-owf-amazon-s3.sh --nobuild --aws-profile=${awsProfile} ${dryrun}

logInfo "Finished running at $(date)"
if [ ${errorCountTotal} -eq 0 ]; then
  logInfo "Exiting with status 0."
else
  logInfo "Exiting with status ${errorCountTotal} (error)."
fi
exit ${errorCountTotal}
