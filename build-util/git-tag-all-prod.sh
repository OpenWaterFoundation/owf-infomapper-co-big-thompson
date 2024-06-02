#!/bin/sh
(set -o igncr) 2>/dev/null && set -o igncr; # this comment is required
# The above line ensures that the script can be run on Cygwin/Linux even with Windows CRNL
#
# git-tag-all-prod - tag all product repositories
# - this script calls the general git utilities script

# Get the location where this script is located since it may have been run from any folder.
scriptFolder=$(cd $(dirname "$0") && pwd)

# Git utilities folder is relative to the user's files in a standard development files location:
# - determine based on location relative to the script folder
# Specific repository folder for this repository.
repoHome=$(dirname ${scriptFolder})
# Want the parent folder to the specific Git repository folder.
gitReposHome=$(dirname ${repoHome})

# Main product repository.
mainRepo="owf-infomapper-poudre"
mainRepoFolder="${gitReposHome}/${mainRepo}"

# Determine the version from the software product:
# - code line looks like:
#   "version": "2.5.0 (2022-07-22)",
# - this is used as information to help the user specify an intelligent tag name and commit message
# - grep -m 1 means stop after first occurrence
productVersion=$(cat ${mainRepoFolder}/web/app-config.json | grep '"version": ' | cut -d ':' -f 2 | cut -d '(' -f 1 | tr -d " " | tr -d '"')
productName="PoudreBasinInformation"

if [ -z "${productVersion}" ]; then
  echo ""
  echo "[ERROR] Unable to get product version."
  exit 1
fi

# Run the generic utility script.
${scriptFolder}/git-util/git-tag-all.sh -m "${mainRepo}" -g "${gitReposHome}" -N "${productName}" -V "${productVersion}" $@
