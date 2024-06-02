# web #

This folder contains files to create and publish the Big Thompson Basin Information website.
The website is implemented using the general OWF InfoMapper application,
which is a web application that provides access to maps, charts, content pages,
dashboards, and other content.

The following illustrates the folder structure for the InfoMapper application software repository and
Big Thompson Basin Information website implementation repository.

```
C:/Users/user/                             User files on Windows.
/C/cygdrive/User/user/                     User's Windows files on Cygwin.
/C/Users/user/                             User's Windows files on Git Bash.
  owf-dev/                                 Open Water Foundation development files.
    InfoMapper-CO-BigThompsonn/            Big Thompson Basin Information website product.
      git-repos/                           Git repositories for the product.
============= above this line is recommended, below is required ==================
        owf-app-infomapper-ng/             InfoMapper repository local files.
                                           Can be developer files or non-developer (read only).
          infomapper/
            src/
              assets/
                app/
        owf-infomapper-co-big-thompson/    Big Thompson Basin Information repository files.
          web/                             Folder that maps to InfoMapper assets/app folder.
            copy-to-infomapper.bash        Script to copy 'web' files to InfoMapper src/assets/app.
                                           All of the following files are recursively copied if newer
                                           in 'web' than InfoMapper 'src/assets/app'.
            app-config.json                Application configuration file.
            content-pages/                 Content pages that are referenced in the app-config.json.
                                           This folder is committed to the repository
                                           because it contains the original copy of files.
            dashboards/                    Configurations for dashboards.
                                           This folder is currently partially saved to the repository
                                           but may be treated more like 'data-maps' in the future.
            data-maps/                     Map configurations and supporting layers and time series files.
                                           Dynamic content for maps.
                                           This folder is ignored from the repository.
            img/                           Images for the application, such as used for map markers.
                                           This folder is committed to the repository
                                           because it contains the original copy of files.
            system/                        Files needed by the entire system.
                                           This folder is committed to the repository
                                           because it contains the original copy of files.
```

An attempt was made to use symbolic links from this `web` folder to the InfoMapper `assets/app` folder
(attempting in both directions), but did not work on Windows 10 and it was generally complicated
to turn on symbolic links.
The symbolic link approach would result in output from workflow processing immediately being
available in the application after it is refreshed.

Instead, a copy strategy is now being used.
The `copy-to-infomapper.bash` script should be run in a Linux-like window (Cygwin, Git Bash, etc.)
and will continue to run until killed with `Ctrl-c`.
(Previously this script, saved as `x-copy-to-infomapper.sh`, required manual running).

Workflow commands in the main 'workflow' folder automate creation of map configuration files.
Most other map content is manually edited (e.g., Markdown documentation files, classification files, and event configuration files).
Large dynamic content should mostly be created in separate repositories,
although some visualizations may require processing in this repository.

Content that is dynamically regenerated should generally be listed in `.gitgnore`.
Snapshots of published content can be saved in versioned website folders,
using the `version` defined in the `app-config.json` file.
For example, published websites on Amazon S3 have a complete list of data files.
