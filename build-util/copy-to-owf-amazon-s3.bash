#!/bin/bash
(set -o igncr) 2>/dev/null && set -o igncr; # This comment is required.
# The above line ensures that the script can be run on Cygwin/Linux even with Windows CRNL.
#
# Copy the staged Info Mapper website to the rivers.openwaterfoundation.org website:
# - replace all the files on the web with local files
# - must specify Amazon profile as argument to the script
# - the script determines the version from the code and optionally uploads to "latest" version
# - tested with Git Bash

# Supporting functions, alphabetized.

# Build the distribution in the staging area.
buildDist() {
  # First build the site so that the "dist" folder contains current content:
  # - see:  https://medium.com/@tomastrajan/6-best-practices-pro-tips-for-angular-cli-better-developer-experience-7b328bc9db81
  # - Put on the command line rather than in project configuration file
  # - enable ahead of time compilation:  --aot
  # - extract all css into separate style-sheet file:  --extractCss true
  # - disable using human readable names for chunk and use numbers instead:  --namedChunks false
  # - force cache-busting for new releases:  --output-hasshing all
  # - disable generation of source maps:  --sourcemaps false
  #
  # See options:  https://angular.io/cli/build

  # Ways to handle the href path:
  # - TODO smalers 2020-04-20 can add this to command line parameters if necessary
  # - "period" works locally in "dist" but not when pushed to the cloud
  # - "path" 
  hrefMode="period"
  if [ "${hrefMode}" = "period" ]; then
    # Results in the following in output:
    # <head>...<base href=".">
    ngBuildHrefOpt="."
  elif [ "${hrefMode}" = "path" ]; then
    ngBuildHrefOpt="/infomapper/"
  else
    logError ""
    logError "Unknown hrefMode=${hrefMode}"
    exit 1
  fi

  # Override to experiment with the base href.

  # If using a period, get the following:
  #  <base href=".">

  # The following results in 503 errors.
  #   <base href="/3.0.0">
  #ngBuildHrefOpt="//3.0.0"

  # The following results in the following, which is incorrect.
  #   <base href="//3.0.0/">
  #ngBuildHrefOpt="//3.0.0/"

  logInfo ""
  logInfo "Regenerating Angular dist folder to deploy the website..."
  logInfo "Changing to:  ${infoMapperMainFolder}"
  cd ${infoMapperMainFolder}

  optimizationArg=""
  if [ "${doOptimization}" = "no" ]; then
    # Turn off optimization.
    optimizationArg="--optimization=false"
  fi

  # Run the ng build:
  # - see: https://angular.io/cli/build
  # - see: https://github.com/angular/angular-cli/issues/5606#issuecomment-397445530
  # - use the command line from 'copy-to-owf-amazon-s3.bat', which was used more recently
  # - this should be found in the Windows PATH, for example C:\Users\user\AppData\Roaming\npm\ng
  # - 2022-05-16 changed --prod=true to --configuration production
  # - 2022-05-16 removed --extractCss=true, which is now the default behavior
  # - 2022-08-01 change camelCase options to lowercase as per the documentation
  logInfo "Start running:  ng build --configuration production --aot=true --base-href=${ngBuildHrefOpt} --named-chunks=false --output-hashing=all --source-map=false ${optimizationArg}"
  ng build --configuration production --aot=true --base-href=${ngBuildHrefOpt} --named-chunks=false --output-hashing=all --source-map=false ${optimizationArg}
  exitCode=$?
  logInfo "...done running 'ng build... (exit code ${exitCode})'"
  if [ "${exitCode}" -ne 0 ]; then
    logError "Error ${exitCode} running 'ng build...'"
    logError "May be an 'ng' error."
    logError "Or may have a terminal open in the 'dist' build folder."
    exit ${exitCode}
  fi

  logInfo "Updating mime type in: ${indexFile}"
  if [ -f "${indexFile}" ]; then
    # Fix the distribution index.html file as per:  
    #   Problem:   https://github.com/angular/angular/issues/30835
    #   Solution:  https://stackoverflow.com/questions/56606789/angular-8-ng-build-throwing-mime-error-with-cordova
    # Replace "module" with "text/javascript" so that Amazon S3 works.
    sed -i 's/type="module"/type="text\/javascript"/g' ${indexFile}
    # Additionally need to insert "defer" at the end of the main-es2015*.js item so it looks like:
    #   <script src="main-es2015.afb0c8c9a69f82c651a0.js" type="text/javascript" defer>
    # TODO smalers 2022-05-16 newer Angular does not have "es2015" in the filename.
    #sed -i 's/main-es2015.*" type="text\/javascript"/& defer/' ${indexFile}
    sed -i 's/main.*js" type="text\/javascript"/& defer/' ${indexFile}

    # Update the index.html to replace '${Google_Analytics_Tracking_id}' with the
    # application configuration '${googleAnalyticsTrackingId}' property.
    # The different property name is used in order to isolate the replacement.
    logDebug "Checking application file:  ${appConfigFile}"
    googleAnalyticsTrackingId=$(grep '"googleAnalyticsTrackingId"' ${appConfigFile} | cut -d ":" -f 2 | tr -d '"' | tr -d ' ' | tr -d ',')
    logDebug "Google Analytics using tracking ID from application configuration:  ${googleAnalyticsTrackingId}"
    if [ -n "${googleAnalyticsTrackingId}" ]; then
      # Replace the Google Analytics tracking ID in the index.html file.
      logInfo "Configuring Google Analytics using tracking ID:  ${googleAnalyticsTrackingId}"
      sed -i "s/id=\${Google_Analytics_Tracking_Id}/id=${googleAnalyticsTrackingId}/" ${indexFile}
    else
      logError "googleAnalyticsTrackingId application configuration property is not set."
      logError "Not configuring Google Analytics."
    fi
  else
    logError "index.html file does not exist: ${indexFile}"
    logError "Maybe the budget needs to be increased?"
    # This tends to cause major issues so exit.
    exit 1
  fi

  # Clean the InfoMapper distribution files to the bare minimum.
  ${infoMapperRepoFolder}/build-util/clean-dist-for-deployment.sh
  exitCode=$?
  if [ ${exitCode} -ne 0 ]; then
    logError "Error cleaning 'dist/' for deployment."
    logError "Check script:  ${infoMapperRepoFolder}/build-util/clean-dist-for-deployment.sh."
    exit 1
  fi
}

# Check to make sure the Angular version is as expected:
# - TODO smalers 2020-04-20 Need to implement
checkAngularVersion() {
  logWarning "Checking Angular version is not implemented.  Continuing."
}

# Check input:
# - make sure that the Amazon profile was specified
# - call this before doing the upload but don't need before then
checkInput() {
  if [ -z "${awsProfile}" ]; then
    logError ""
    logError "Amazon profile to use for upload was not specified with --aws-profile option.  Exiting."
    printUsage
    exit 1
  fi
}

# Determine the operating system that is running the script:
# - mainly care whether Cygwin or MINGW (Git Bash)
checkOperatingSystem() {
  if [ ! -z "${operatingSystem}" ]; then
    # Have already checked operating system so return.
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

# Echo to stderr:
# - if necessary, quote the string to be printed
# - this function is called to print various message types
echoStderr() {
  echo "$@" 1>&2
}

# Get the CloudFront distribution ID from the bucket so the ID is not hard-coded.
# The distribution ID is echoed and can be assigned to a variable.
# The output is similar to the following (obfuscated here):
# ITEMS   arn:aws:cloudfront::123456789000:distribution/ABCDEFGHIJKLMN    learn.openwaterfoundation.org   123456789abcde.cloudfront.net   True    HTTP2   ABCDEFGHIJKLMN  True    2022-01-05T23:29:28.127000+00:00        PriceClass_100  Deployed
getCloudFrontDistribution() {
  local cloudFrontDistributionId subdomain
  subdomain="rivers.openwaterfoundation.org"
  cloudFrontDistributionId=$(${awsExe} cloudfront list-distributions --output text --profile "${awsProfile}" | grep ${subdomain} | grep "arn:" | awk '{print $2}' | cut -d ':' -f 6 | cut -d '/' -f 2)
  echo ${cloudFrontDistributionId}
}

# Get the user's login:
# - Git Bash apparently does not set $USER environment variable, not an issue on Cygwin
# - Set USER as script variable only if environment variable is not already set
# - See: https://unix.stackexchange.com/questions/76354/who-sets-user-and-username-environment-variables
getUserLogin() {
  if [ -z "${USER}" ]; then
    if [ ! -z "${LOGNAME}" ]; then
      USER=${LOGNAME}
    fi
  fi
  if [ -z "${USER}" ]; then
    USER=$(logname)
  fi
  # Else - not critical since used for temporary files.
}

# Get the InfoMapper version and Big Thompson Basin Information Portal version.
# - the version is in the 'web/app-config.json' file in format:  "version": "0.7.0.dev (2020-04-24)"
# - the Info Mapper software version in 'assets/version.json' with format similar to above
getVersion() {
  # Application version.
  if [ ! -f "${appConfigFile}" ]; then
    logError "Application version file does not exist: ${appConfigFile}"
    logError "Exiting."
    exit 1
  fi
  appVersion=$(grep '"version":' ${appConfigFile} | cut -d ":" -f 2 | cut -d "(" -f 1 | tr -d '"' | tr -d ' ' | tr -d ',')
  # InfoMapper version.
  infoMapperVersionFile="${infoMapperMainFolder}/src/assets/version.json"
  if [ ! -f "${infoMapperVersionFile}" ]; then
    logError "InfoMapper version file does not exist: ${infoMapperVersionFile}"
    logError "Exiting."
    exit 1
  fi
  infoMapperVersion=$(grep '"version":' ${infoMapperVersionFile} | cut -d ":" -f 2 | cut -d "(" -f 1 | tr -d '"' | tr -d ' ' | tr -d ',')
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

# Parse the command parameters:
# - use the getopt command line program so long options can be handled
parseCommandLine() {
  # Single character options.
  optstring="hv"
  # Long options.
  optstringLong="aws-profile::,dryrun,help,nobuild,noupload,nooptimization,upload-assets,upload-datamaps,version"
  # Parse the options using getopt command.
  GETOPT_OUT=$(getopt --options ${optstring} --longoptions ${optstringLong} -- "$@")
  exitCode=$?
  if [ ${exitCode} -ne 0 ]; then
    # Error parsing the parameters such as unrecognized parameter.
    echoStderr ""
    printUsage
    exit 1
  fi
  # The following constructs the command by concatenating arguments.
  eval set -- "${GETOPT_OUT}"
  # Loop over the options.
  while true; do
    #logDebug "Command line option is ${opt}"
    case "$1" in
      --aws-profile) # --aws-profile=profile  Specify the AWS profile (use default).
        case "$2" in
          "") # Nothing specified so error.
            logError "--aws-profile=profile is missing profile name"
            exit 1
            ;;
          *) # profile has been specified.
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
      -h|--help) # -h or --help  Print the program usage.
        printUsage
        exit 0
        ;;
      --nobuild) # --nobuild  Indicate to not build to staging area.
        logInfo "--nobuild detected - will not build to 'dist' folder"
        doBuild="no"
        shift 1
        ;;
      --nooptimization) # --nooptimization  Control 'ng build --optimization'.
        logInfo "--nooptimization detected - will set 'ng build --optimization=false"
        doOptimization="no"
        shift 1
        ;;
      --noupload) # --noupload  Indicate to create staging area dist but not upload.
        logInfo "--noupload detected - will not upload 'dist' folder"
        doUpload="no"
        shift 1
        ;;
      --upload-assets) # --upload-assets  Indicate to only upload assets.
        logInfo "--upload-assets detected - will upload only 'assets' folder"
        uploadOnlyAssets="yes"
        shift 1
        ;;
      --upload-datamaps) # --upload-datamaps  Indicate to only upload data-maps.
        logInfo "--upload-datamaps detected - will upload only 'assets/app/data-maps' folder"
        uploadOnlyDataMaps="yes"
        shift 1
        ;;
      -v|--version) # -v or --version  Print the program version.
        printVersion
        exit 0
        ;;
      --) # No more arguments.
        shift
        break
        ;;
      *) # Unknown option.
        logError ""
        logError "Invalid option $1." >&2
        printUsage
        exit 1
        ;;
    esac
  done
}

# Print the program usage to stderr:
# - calling code must exit with appropriate code
printUsage() {
  echoStderr ""
  echoStderr "Usage:  ${programName} --aws-profile=profile"
  echoStderr ""
  echoStderr "Copy the Big Thompson Basin Information Portal application files to the Amazon S3 static website folder(s),"
  echoStderr "using the AWS S3 sync capabilities."
  echoStderr ""
  echoStderr "               ${s3FolderVersionUrl}"
  echoStderr "  optionally:  ${s3FolderLatestUrl}"
  echoStderr ""
  echoStderr "--aws-profile=profile   Specify the Amazon profile to use for AWS credentials."
  echoStderr "--dryrun                Do a dryrun but don't actually upload anything."
  echoStderr "-h or --help            Print the usage."
  echoStderr "--nobuild               Do not run 'ng build...' to create the 'dist' folder contents, useful for testing."
  echoStderr "--noupload              Do not upload the staging area 'dist' folder contents, useful for testing."
  echoStderr "--nooptimization        Set --optimization=false for 'ng build' useful for troubleshooting."
  echoStderr "--upload-assets         Only upload (sync) the 'assets' folder."
  echoStderr "--upload-datamaps       Only upload (sync) the 'assets/app/data-maps' folder."
  echoStderr "-v or --version         Print the version and copyright/license notice."
  echoStderr ""
}

# Print the script version and copyright/license notices to stderr:
# - calling code must exit with appropriate code
printVersion() {
  echoStderr ""
  echoStderr "${programName} version ${programVersion} ${programVersionDate}"
  echoStderr ""
  echoStderr "Big Thompson Basin Information"
  echoStderr "Copyright 2024 Open Water Foundation."
  echoStderr ""
  echoStderr "License GPLv3+:  GNU GPL version 3 or later"
  echoStderr ""
  echoStderr "There is ABSOLUTELY NO WARRANTY; for details see the"
  echoStderr "'Disclaimer of Warranty' section of the GPLv3 license in the LICENSE file."
  echoStderr "This is free software: you are free to change and redistribute it"
  echoStderr "under the conditions of the GPLv3 license in the LICENSE file."
  echoStderr ""
}

# Set the AWS executable:
# - handle different operating systems
# - for AWS CLI V2, can call an executable
# - for AWS CLI V1, have to deal with Python
# - once set, use ${awsExe} as the command to run, followed by necessary command parameters
setAwsExe() {
  if [ "${operatingSystem}" = "mingw" ]; then
    # "mingw" is Git Bash:
    # - the following should work for V2
    # - if "aws" is in path, use it
    awsExe=$(command -v aws)
    if [ -n "${awsExe}" ]; then
      # Found aws in the PATH.
      awsExe="aws"
    else
      # Might be older V1.
      # Figure out the Python installation path.
      pythonExePath=$(py -c "import sys; print(sys.executable)")
      if [ -n "${pythonExePath}" ]; then
        # Path will be something like:  C:\Users\sam\AppData\Local\Programs\Python\Python37\python.exe
        # - so strip off the exe and substitute Scripts
        # - convert the path to posix first
        pythonExePathPosix="/$(echo "${pythonExePath}" | sed 's/\\/\//g' | sed 's/://')"
        pythonScriptsFolder="$(dirname "${pythonExePathPosix}")/Scripts"
        echo "${pythonScriptsFolder}"
        awsExe="${pythonScriptsFolder}/aws"
      else
        echo "[ERROR] Unable to find Python installation location to find 'aws' script"
        echo "[ERROR] Make sure Python 3.x is installed on Windows so 'py' is available in PATH"
        exit 1
      fi
    fi
  else
    # For other Linux, including Cygwin, just try to run.
    awsExe="aws"
  fi
}

# Synchronize the Angular application files to S3:
# - also invalidate the CloudFront distribution 
syncFiles() {
  local cloudFrontDistributionId doSync s3FolderUrl subdomain

  s3FolderUrl=$1
  deployedVersion=$2

  if [ -z "${s3FolderUrl}" ]; then
    logError "S3 folder is not specified for the S3 files."
    exit 1
  fi
  if [ -z "${deployedVersion}" ]; then
    logError "Deployed version is not specified for the S3 files."
    exit 1
  fi
  if [ -z "${deployedRoot}" ]; then
    logError "deployedRoot is not specified in the script."
    exit 1
  fi

  # Must edit the <base href> for path location strategy:
  # - this has to be done after building, based on the version folder

  # Change:
  #  <base href=".">
  # to:
  #  <base href="/3.0.0/">
  #  or:
  #  <base href="/latest/">
  logInfo "Updating <base href...> to ${deployedRoot}/${deployedVersion}/ in:"
  logInfo "  ${indexFile}"
  sed -i "s~^.*<base href=.*$~  <base href=\"${deployedRoot}/${deployedVersion}/\">~" ${indexFile}

  # First synchronize the files to S3.
  doSync="true"
  if [ "${doSync}" = "true" ]; then
    ${awsExe} s3 sync ${infoMapperDistAppFolder} ${s3FolderUrl} ${dryrun} --delete --profile "${awsProfile}"
    errorCode=$?
    if [ ${errorCode} -ne 0 ]; then
      logError "Error code ${errorCode} from 'aws' command.  Exiting."
      exit 1
    fi
  fi

  # Save the output to a temporary file and then extract the invalidation ID.
  tmpFile=$(mktemp)
  logInfo "Invalidating files so that CloudFront will make new files available..."
  logInfo "  Save output to: ${tmpFile}"

  # Also invalidate the CloudFront distribution so that new version will be displayed:
  # - see:  https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html
  # Determine the distribution ID:
  # The distribution list contains a line like the following (the actual distribution ID is not included here):
  # ITEMS   arn:aws:cloudfront::132345689123:distribution/E1234567891234    rivers.openwaterfoundation.org  something.cloudfront.net    True    HTTP2   E1234567891334  True    2022-01-06T19:02:50.640Z        PriceClass_100Deployed
  subdomain="rivers.openwaterfoundation.org"
  # TODO smalers 2022-10-11 remove the following when tested out
  #cloudFrontDistributionId=$(${awsExe} cloudfront list-distributions --profile "${awsProfile}" | grep ${subdomain} | grep "arn" | awk '{print $2}' | cut -d ':' -f 6 | cut -d '/' -f 2)
  cloudFrontDistributionId=$(getCloudFrontDistribution)
  if [ -z "${cloudFrontDistributionId}" ]; then
    logError "Unable to find CloudFront distribution ID."
    exit 1
  else
    logInfo "Found CloudFront distribution ID: ${cloudFrontDistributionId}"
  fi
  logInfo "Invalidating files so that CloudFront will make new files available..."
  if [ "${operatingSystem}" = "mingw" ]; then
    MSYS_NO_PATHCONV=1 ${awsExe} cloudfront create-invalidation --distribution-id ${cloudFrontDistributionId} --paths "${deployedRoot}/${deployedVersion}/*" --output json --profile "${awsProfile}" | tee ${tmpFile}
  else
    ${awsExe} cloudfront create-invalidation --distribution-id ${cloudFrontDistributionId} --paths "${deployedRoot}/${deployedVersion}/*" --output json --profile "${awsProfile}" | tee ${tmpFile}
  fi
  errorCode=${PIPESTATUS[0]}
  if [ ${errorCode} -ne 0 ]; then
    logError " "
    logError "Error invalidating CloudFront file(s)."
    return 1
  else
    logInfo "Success invalidating CloudFront file(s)."
    # Now wait on the invalidation.
    invalidationId=$(cat ${tmpFile} | grep '"Id":' | cut -d ':' -f 2 | tr -d ' ' | tr -d '"' | tr -d ',')
    waitOnInvalidation ${cloudFrontDistributionId} ${invalidationId}
  fi
  return 0
}

# Upload the staging area 'dist' files to S3.
uploadDist() {
  logInfo "Changing to:  ${scriptFolder}"
  cd ${scriptFolder}

  if [ ! -d "${infoMapperDistAppFolder}" ]; then
    logError ""
    logError "dist/app to sync to S3 does not exist:  ${infoMapperDistAppFolder}"
    exit 1
  fi

  # Check input:
  # - check that Amazon profile was specified
  checkInput

  # Add an upload log file to the dist, useful to know who did an upload.
  uploadLogFile="${infoMapperDistAppFolder}/upload.log.txt"
  echo "UploadUser = ${USER}" > ${uploadLogFile}
  now=$(date "+%Y-%m-%d %H:%M:%S %z")
  echo "UploadTime = ${now}" >> ${uploadLogFile}
  echo "UploaderName = ${programName}" >> ${uploadLogFile}
  echo "UploaderVersion = ${programVersion} ${programVersionDate}" >> ${uploadLogFile}
  echo "AppVersion = ${appVersion}" >> ${uploadLogFile}
  echo "InfoMapperVersion = ${infoMapperVersion}" >> ${uploadLogFile}

  if [ "${uploadOnlyAssets}" = "yes" ]; then
    # Only updating assets:
    # - adjust the source folder and URL to be more specific
    echo "Only uploading 'assets' files."
    infoMapperDistAppFolder="${infoMapperDistAppFolder}/assets"
    s3FolderVersionUrl="${s3FolderVersionUrl}/assets"
    s3FolderLatestUrl="${s3FolderLatestUrl}/assets"
  elif [ "${uploadOnlyDataMaps}" = "yes" ]; then
    # Only updating data-maps:
    # - adjust the source folder and URL to be more specific
    # - put this after so the most specific folder is used
    echo "Only uploading 'assets/app/data-maps' files."
    infoMapperDistAppFolder="${infoMapperDistAppFolder}/assets/app/data-maps"
    s3FolderVersionUrl="${s3FolderVersionUrl}/assets/app/data-maps"
    s3FolderLatestUrl="${s3FolderLatestUrl}/assets/app/data-maps"
  fi

  # First upload to the version folder.
  echo "Uploading (aws sync) application ${appVersion} version"
  echo "  from: ${infoMapperDistAppFolder}"
  echo "    to: ${s3FolderVersionUrl}"
  echo "Uploading application ${appVersion} version."
  read -p "Continue [Y/n/q] (if 'n', will still be able to upload 'latest')? " answer
  if [ "${answer}" = "q" -o "${answer}" = "Q" ]; then
    exit 0
  elif [ -z "${answer}" -o "${answer}" = "y" -o "${answer}" = "Y" ]; then
    logInfo "Starting aws sync of ${appVersion} copy..."
    syncFiles "${s3FolderVersionUrl}" "${appVersion}"
    logInfo "...done with aws sync of ${appVersion} copy."
  fi

  # Next upload to the 'latest' folder:
  # - TODO smalers 2020-04-20 evaluate whether to prevent 'dev' versions to be updated to 'latest'
  echo "Uploading Angular 'latest' version"
  echo "  from: ${infoMapperDistAppFolder}"
  echo "    to: ${s3FolderLatestUrl}"
  read -p "Continue [Y/n/q]? " answer
  if [ "${answer}" = "q" -o "${answer}" = "Q" ]; then
    exit 0
  elif [ -z "${answer}" -o "${answer}" = "y" -o "${answer}" = "Y" ]; then
    logInfo "Starting aws sync of 'latest' copy..."
    syncFiles "${s3FolderLatestUrl}" "latest"
    logInfo "...done with aws sync of 'latest' copy."
  fi
}

# Wait on an invalidation until it is complete:
# - first parameter is the CloudFront distribution ID
# - second parameter is the CloudFront invalidation ID
waitOnInvalidation () {
  local distributionId invalidationId output totalTime
  local inProgressCount totalTime waitSeconds

  distributionId=$1
  invalidationId=$2
  if [ -z "${distributionId}" ]; then
    logError "No distribution ID provided."
    return 1
  fi
  if [ -z "${invalidationId}" ]; then
    logError "No invalidation ID provided."
    return 1
  fi

  # Output looks like this:
  #   INVALIDATIONLIST        False           100     67
  #   ITEMS   2022-12-03T07:00:47.490000+00:00        I3UE1HOF68YV8W  InProgress
  #   ITEMS   2022-12-03T07:00:17.684000+00:00        I30WL0RTQ51PXW  Completed
  #   ITEMS   2022-12-03T00:46:38.567000+00:00        IFMPVDA8EX53R   Completed

  totalTime=0
  waitSeconds=5
  logInfo "Waiting on invalidation for distribution ${distributionId} invalidation ${invalidationId} to complete..."
  while true; do
    # The following should always return 0 or greater.
    #logInfo "Running: ${awsExe} cloudfront list-invalidations --distribution-id \"${cloudFrontDistributionId}\" --no-paginate --output text --profile \"${awsProfile}\""
    #${awsExe} cloudfront list-invalidations --distribution-id "${cloudFrontDistributionId}" --no-paginate --output text --profile "${awsProfile}"
    inProgressCount=$(${awsExe} cloudfront list-invalidations --distribution-id "${cloudFrontDistributionId}" --no-paginate --output text --profile "${awsProfile}" | grep "${invalidationId}" | grep InProgress | wc -l)
    #logInfo "inProgressCount=${inProgressCount}"

    if [ -z "${inProgressCount}" ]; then
      # This should not happen?
      logError "No output from listing invalidations for distribution ID:  ${cloudFrontDistributionId}"
      return 1
    fi

    if [ ${inProgressCount} -gt 0 ]; then
      logInfo "Invalidation status is InProgress.  Waiting ${waitSeconds} seconds (${totalTime} seconds total)..."
      sleep ${waitSeconds}
    else
      # Done with invalidation.
      break
    fi

    # Increment the total time.
    totalTime=$(( ${totalTime} + ${waitSeconds} ))
  done

  logInfo "Invalidation is complete (${totalTime} seconds total)."

  return 0
}

# Entry point into the script.

# Check the operating system.
checkOperatingSystem

# Set the 'aws' program to use:
# - must set after the operating system is set
setAwsExe

# Make sure the Angular version is OK.
checkAngularVersion

# Get the user login:
# - necessary for the upload log
getUserLogin

# Get the folder where this script is located since it may have been run from any folder.
scriptFolder=$(cd $(dirname "$0") && pwd)
# mainFolder is infomapper
repoFolder=$(dirname ${scriptFolder})
webFolder=${repoFolder}/web
gitReposFolder=$(dirname ${repoFolder})
# Start must be consistent with Info Mapper...
infoMapperRepoFolder="${gitReposFolder}/owf-app-infomapper-ng"
infoMapperMainFolder="${infoMapperRepoFolder}/infomapper"
infoMapperDistFolder="${infoMapperMainFolder}/dist"
# TODO smalers 2020-04-20 is the app folder redundant?
# - it is not copied to S3
infoMapperDistAppFolder="${infoMapperDistFolder}/infomapper"
# Application configuration file used to extract application version and Google Analytics tracking ID.
appConfigFile="${webFolder}/app-config.json"
# Index file in the dist build.
indexFile="${infoMapperDistAppFolder}/index.html"
# ...end must match Info Mapper
programName=$(basename $0)
programVersion="1.6.0"
programVersionDate="2020-12-02"
logInfo "scriptFolder:             ${scriptFolder}"
logInfo "Program name:             ${programName}"
logInfo "repoFolder:               ${repoFolder}"
logInfo "webFolder:                ${webFolder}"
logInfo "appConfigFile:            ${appConfigFile}"
logInfo "gitReposFolder:           ${gitReposFolder}"
logInfo "infoMapperRepoFolder:     ${infoMapperRepoFolder}"
logInfo "infoMapperMainFolder:     ${infoMapperMainFolder}"
logInfo "infoMapperDistFolder:     ${infoMapperDistFolder}"
logInfo "infoMapperDistAppFolder:  ${infoMapperDistAppFolder}"

# S3 folder for upload:
# - put before parseCommandLine so can be used in print usage, etc.
getVersion
logInfo "Application version:  ${appVersion}"
logInfo "InfoMapper version:   ${infoMapperVersion}"
s3FolderVersionUrl="s3://rivers.openwaterfoundation.org/state/co/big-thompson/${appVersion}"
s3FolderLatestUrl="s3://rivers.openwaterfoundation.org/state/co/big-thompson/latest"
# Deployed root is needed because not installing to the root folder of a bucket:
# - "latest/" or "1.2.3/" will be appended to the following
# - don't use a trailing / because it is added later
deployedRoot="/state/co/big-thompson"

# Parse the command line.
# Specify AWS profile with --aws-profile.
awsProfile=""
# Default is not to do 'aws' dry run:
# - override with --dryrun
dryrun=""
# Default is to build the dist and upload.
doBuild="yes"
doUpload="yes"
# Only update /assets:
# - used when updating data files and configurations
# - should work OK but may need to refine to only upload data layers
#   but no configuration files
uploadOnlyAssets="no"
# Only update /assets/app/data-maps:
# - used when updating data layers but not the InfoMapper
# - should work OK but may need to refine to only upload data layers
#   but no configuration files
uploadOnlyDataMaps="no"
# Default is optimization for 'ng build', which is the ng default.
doOptimization="yes"
parseCommandLine "$@"

# Build the distribution.
if [ "${doBuild}" = "yes" ]; then
  buildDist
fi

# Upload the distribution to S3.
if [ "${doUpload}" = "yes" ]; then
  uploadDist
fi

# TODO smalers 2020-04-20 need to suggest how to run
# - maybe a one-line Python http server command?
logInfo "Run the application in folder: ${infoMapperDistAppFolder}"

# If here, was successful.
exit 0
