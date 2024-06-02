# Troubleshooting #

## `node` program not found

Try running the following in `build-util`:

```
./copy-to-owf-amazon-s3.sh --aws-profile=owf-steve --upload-assets
[WARNING] Checking Angular version is not implemented.  Continuing.
[INFO] scriptFolder:             /c/Users/sam/owf-dev/InfoMapper-Poudre/git-repos/owf-infomapper-poudre/build-util
[INFO] Program name:             copy-to-owf-amazon-s3.sh
[INFO] repoFolder:               /c/Users/sam/owf-dev/InfoMapper-Poudre/git-repos/owf-infomapper-poudre
[INFO] webFolder:                /c/Users/sam/owf-dev/InfoMapper-Poudre/git-repos/owf-infomapper-poudre/web
[INFO] appConfigFile:            /c/Users/sam/owf-dev/InfoMapper-Poudre/git-repos/owf-infomapper-poudre/web/app-config.json
[INFO] gitReposFolder:           /c/Users/sam/owf-dev/InfoMapper-Poudre/git-repos
[INFO] infoMapperRepoFolder:     /c/Users/sam/owf-dev/InfoMapper-Poudre/git-repos/owf-app-infomapper-ng
[INFO] infoMapperMainFolder:     /c/Users/sam/owf-dev/InfoMapper-Poudre/git-repos/owf-app-infomapper-ng/infomapper
[INFO] infoMapperDistFolder:     /c/Users/sam/owf-dev/InfoMapper-Poudre/git-repos/owf-app-infomapper-ng/infomapper/dist
[INFO] infoMapperDistAppFolder:  /c/Users/sam/owf-dev/InfoMapper-Poudre/git-repos/owf-app-infomapper-ng/infomapper/dist/infomapper
[INFO] Application version:  2.4.0
[INFO] InfoMapper version:   2.2.0
[INFO] --upload-assets detected - will upload only 'assets' folder
[INFO]
[INFO] Regenerating Angular dist folder to deploy the website...
[INFO] Changing to:  /c/Users/sam/owf-dev/InfoMapper-Poudre/git-repos/owf-app-infomapper-ng/infomapper
[INFO] Start running:  ng build --prod=true --aot=true --baseHref=. --extractCss=true --namedChunks=false --outputHashing=all --sourceMap=false
/c/Users/sam/AppData/Roaming/npm/ng: line 12: node: command not found
[INFO] ...done running 'ng build... (exit code 127)'
[ERROR] Error 127 running 'ng build...'
[ERROR] May be an 'ng' error.
[ERROR] Or may have a terminal open in the 'dist' build folder.
```

The `/c/Users/sam/AppData/Roaming/npm/ng` script has the following:

```
#!/bin/sh
basedir=$(dirname "$(echo "$0" | sed -e 's,\\,/,g')")

case `uname` in
    *CYGWIN*) basedir=`cygpath -w "$basedir"`;;
esac

if [ -x "$basedir/node" ]; then
  "$basedir/node"  "$basedir/node_modules/@angular/cli/bin/ng" "$@"
  ret=$?
else
  node  "$basedir/node_modules/@angular/cli/bin/ng" "$@"
  ret=$?
fi
exit $ret
```

The `node` software is apparently not found in the `PATH`.
Updating the script to print `basedir` outputs `/c/Users/sam/AppData/Roaming/npm`.
Trying to run `npm install` in the `../../owf-app-infomapper-ng/infomapper` folder does not find `npm`.
It seems that `npm` and `node` have been uninstalled,
maybe automatically by a Windows update?
Go to `nodejs.org` and download and reinstall the LTS release.
This tries to install into `C:\Program Files\nodejs`.
This folder exists.  So why is it not in the `PATH`?  It used to work OK.
Manually add the folder to the `PATH` and run the 
```./copy-to-owf-amazon-s3.sh --aws-profile=owf-steve --upload-assets```
command.  It works.  Add the path to the user's environment variable for the Windows account.
