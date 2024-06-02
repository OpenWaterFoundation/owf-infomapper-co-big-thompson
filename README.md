# owf-infomapper-co-big-thompson #

This repository contains the InfoMapper implementation for
the Big Thompson Basin Information website.
The OWF InfoMapper web application provides access to maps, graphs, and other information products.
See also:

*   [owf-app-infomapper-ng](https://github.com/OpenWaterFoundation/owf-app-infomapper-ng)
    repository for the general InfoMapper web application code.
*   [Deployed prototype application](https://rivers.openwaterfoundation.org/co/big-thompson/latest/)

The following sections are included in this documentation:

*   [Repository Contents](#repository-contents)
*   [Application Menus and Corresponding Workflow](#application-menus-and-corresponding-workflows)
*   [Development Environment](#development-environment)
    +   [Quick Start](#quick-start)
    +   [Development Tools](#development-tools)
    +   [InfoMapper Configuration](#infomapper-configuration)
*   [Maintainers](#maintainers)

--------------

## Repository Contents ##

The following folder structure is recommended for development.
Top-level folders should be created as necessary.
The following folder structure clearly separates user files (as per operating system),
development area (`owf-dev`), product (`InfoMapper-CO-BigThompson`), repositories for product (`git-repos`),
and specific repositories for the product.
Repository folder names should agree with GitHub repository names.
Scripts in repository folders that process data should detect their starting location
and then locate other folders based on the following convention.

```
C:\Users\user\                                 User's home folder for Windows.
/c/Users/user/                                 User's home folder for Git Bash.
/cygdrive/C/Users/user/                        User's home folder for Cygwin.
/home/user/                                    User's home folder for Linux.
  owf-dev/                                     Work done on Open Water Foundation projects.
    InfoMapper-CO-BigThompson/                 Big Thompson Information website, using InfoMapper
                                               (name of this folder is recommended).
      ---- below here folder names should match exactly ----
      git-repos/                               Git repositories for the Angular portal web application software.
        owf-app-infomapper-ng/                 InfoMapper web application.
        owf-infomapper-co-big-thompson/        Workflow files to process input for web application.
```

This repository contains the following:

```
owf-infomapper-co-big-thompson/        Workflow files to process input for web application.
  .git/                                Standard Git software folder for repository (DO NOT TOUCH).
  .gitattributes/                      Standard Git configuration file for repository (for portability).
  .gitignore/                          Standard Git configuration file to ignore dynamic working files.
  build-util/                          Scripts to manage repository, as needed.
    git-check-prod.sh                  Check whether need to push/pull any product repositories.
  qgis/                                Files that QGIS can use.
    latest/                            Latest files from "process" steps (data files are in gitgnore).
      *.qgs                            QGIS project file, saved in repo to preserve configuration.
    snapshots/                         Periodic saved snapshots of QGIS files, useful to freeze test data
                                       in the repository so web application developers don't need to regenerate.
                                       This is being evaluated.
  web/                                 Location of assembled website files created by workflow steps.
                                       Will be copied to InfoMapper 'assets/app' folder.
    content-pages/                     Content pages displayed in the website.
    dashboards/                        Dashboard configurations.
    img/                               Shared image files.
    system/                            Shared system files such as data units.
  workflow/                            Command files and scripts to download and process data into maps
                                       and other information products.  Folders match menu organization.
```

## Application Menus and Corresponding Workflow ##

The web application provides menus, which display context-specific maps, as follows.
The README for each product provides information about data sources and workflow processing.

| **Menu** | **README** | **Description** |
| -- | -- | -- |
| ***Basin Entities /*** | ===========| ===============================|
| ***Physical - Counties*** | [README](workflow/BasinEntities/Physical-Counties/doc/README.md) | Counties that provide or consume basin water. |
| ***Physical - Hydrologic Unit Codes*** | | |
| ***Physical - Stream Reaches*** | [README](workflow/BasinEntities/Physical-StreamReaches/doc/README.md) | Stream reaches in the basin. |
| ***Administrative - Division 1 Water Districts*** | [README](workflow/BasinEntities/Administrative-CoDwrWaterDistricts/doc/README.md) | Colorado Division of Water Resources administrative basins. |
| ***Agricultural - Dairies*** | [README](workflow/BasinEntities/Agriculture-Dairies/doc/README.md) | Statewide dairies layer. |
| ***Agricultural - Ditches*** | [README](workflow/BasinEntities/Agriculture-Ditches/doc/README.md) | Ditch service areas. |
| ***Environmental - Instream Flow Reaches*** | [README](workflow/BasinEntities/Environmental-InstreamFlowReaches/doc/README.md) | Instream flow reaches with water rights for environmental flows. |
| ***Environmental - Organizations*** | | |
| ***Industry - Breweries*** | [README](workflow/BasinEntities/Industry-Breweries/doc/README.md) | Breweries in the Basin. |
| ***Municipal - Municipalities*** | | |
| ***Recreation - Boating Companies*** | | |
| ***Recreation - Trails*** | | |
| ***Water Supply - Water Providers*** | | |
| ***Water Supply - Transbasin*** | | |
| ***Historical Data /*** | ===========| ===============================|
| ***Agriculture - Ditch Company Ownership*** | | |
| ***Agriculture - Diversions*** | | |
| ***Agriculture - Irrigated Lands*** | [README](workflow/HistoricalData/Agriculture-IrrigatedLands/doc/README.md) | Irrigated lands, indicating parcels, crop, and irrigation method, used to estimate agricultural water demand and use. |
| ***Agriculture - Water Rentals*** | | |
| ***Environment - Climate Change*** | | |
| ***Environment - Floods*** | | |
| ***Environment - Flows*** | | |
| ***Municipal - Population*** | | |
| ***Municipal - Water Demand*** | | |
| ***Recreation - Boating Days*** | | |
| ***Water Supply - CBT Quota and Water Supplies*** | | |
| ***Water Supply - Snow*** | | |
| ***Water Supply - Streamflow*** | | |
| ***Current Conditions /*** | ===========| ===============================|
| ***System - Point Flow*** | | |
| ***Administration - Calls*** | | |
| ***Environment - Wildfire Burn Areas*** | | |
| ***Recreation - Boating*** | | |
| ***Recreation - Fishing*** | | |
| ***Water Supply - Drought*** | | |
| ***Water Supply - Operations*** | | |
| ***Water Supply - Reservoirs (Storage)*** | | |
| ***Water Supply - Snowpack (SNODAS)*** | | |
| ***Water Supply - Snowpack (NRCS)*** | | |
| ***Water Supply - Streamflow*** | [README](workflow/CurrentConditions/WaterSupply-Streamflow/doc/README.md) | Flow measurement points. |
| ***Weather - Evapotranspiration*** | | |
| ***Weather - Soil Moisture*** | | |
| ***Weather - Wind*** | | |
| ***Seasonal Outlook /*** | ===========| ===============================|
| ***System*** | | |
| ***Agriculture - Diversions*** | | |
| ***Water Supply - CBT Quota*** | | |
| ***Water Supply - Drought*** | | |
| ***Water Supply - Operations*** | | |
| ***Water Supply - Reservoirs (Storage)*** | | |
| ***Water Supply - Snow*** | | |
| ***Future Planning /*** | ===========| ===============================|
| ***Agriculture - Land Transfer*** | | |
| ***Environment - Climate Change*** | | |
| ***Environment - Open Space*** | | |
| ***Environment - Watershed Plans*** | | |
| ***Municipal - Growth*** | | |
| ***Municipal - Major Projects*** | | |
| ***Municipal - Stormwater/Floodplain Plans*** | | |

## Development Environment ##

This section provides an overview of the development environment.

### Quick Start ###

Do the following to set up a new development environment, assuming that development tools are installed.
Skip software installation steps if tools have been previously installed.
See the next section for more information about installing necessary tools.
**The following approach copies website content from `owf-infomapper-co-big-thompson` repository
into the the `owf-app-infomapper-ng/infomapper/src/assets/app` folder
(it should be possible to use a symbolic link rather than copy, but this has not worked on Windows).**

1.  On windows, create a folder `C:\Users\user\owf-dev\InfoMapper-BigThompson\git-repos`,
    as per the [Repository Contents](#repository-contents) section above.
2.  Typically, start a Git Bash or Cygwin terminal for development.  Command line scripts are run to process and copy files.
3.  In the above folder, clone the repository:  `git clone https://github.com/OpenWaterFoundation/owf-infomapper-co-big-thompson.git`
4.  In the above repository, change to `build-util`.
5.  Clone other related repositories, including InfoMapper:  `./git-clone-all-prod.sh`
6.  Update the InfoMapper working files:
    1.  Change to the `git-repos/owf-app-infomapper-ng/infomapper` folder.
    2.  Install needed modules:  `npm install`
    3.  **Do not run `npm audit fix`**, which can unexpectedly change Angular packages and cause errors building the software.
        The development team will work to update packages as time allows.
        Options used with `npm audit` may be appropriate but have not been tested.
    4.  Test: `ng serve --open`.
        The application should display in a browser with menu bar title ***Info Mapper***,
        which is the default when content is not available.
7.  Create and test the Big Thompson Basin Information application content:
    1.  Run the command files in the `git-repos/owf-infomapper-co-big-thompson/workflow` folder
        to create and assemble content in the `web/` folder.
        **Automated execution of all steps together will be implemented at some point.**
    2.  Run the `git-repos/owf-infomapper-co-big-thompson/web/copy-to-infomapper.sh` script,
        which copies files in `web/` folder to the InfoMapper appliction files.
    3.  In the `git-repos/owf-app-infomapper-ng/infomapper` folder, run `ng serve --open` to start the application server.
        The application should display in a browser with menu bar title ***Big Thompson Basin Information***.
8.  Publish the application to the web:
    1.  Run the `build-util/copy-to-owf-amazon-s3.sh` script to copy the
        InfoMapper `assets/app/` folder to the cloud.  A versioned and `latest` folder can be updated.
        See the deployed [latest Big Thompson Basin Information website](https://rivers.openwaterfoundation.org/co/big-thompson),
        which will redirect to the latest version.

### Update Environment for InfoMapper Changes ###

The InfoMapper software is developed as a general tool and is included in the deployed files.
New versions of the InfoMapper are made available periodically and need to be pulled into the Big Thompson Basin Information files.
This assumes that the folder structure described above is used.
To update the InfoMapper software, run the commands in Git Bash or equivalent.

1.  Change to the `owf-app-infomapper-ng` folder.
2.  Discard local file changes that are automatically created by the development environment and don't need to be committed.
    These files are updated in the development environment and the deployed environment does not need to commit to the repository.
    1.  Run `git status`.
    2.  Typically:  `git restore infomapper/package-lock.json`.
    3.  Typically:  `rm package-lock.json`
    4.  Sometimes files are accidentally created in the InfoMapper development files
        and these files can usually be deleted without committing to the repository.
3.  Update the InfoMapper software files:
    1.  `git pull` - there should be no conflicts if the above local changes were removed.
4.  Update the InfoMapper dependencies:
    1.  Change to the `owf-app-infomapper-ng/infomapper` folder.
    2.  `npm install`
    3.  If warnings result, use: `npm install --legacy-peer-deps`
        (see the troubleshooting below).
        If necessary, use `npm install --force` if an older version of `npm` is used (older than version 8?).
5.  Run the InfoMapper to allow changes for the implementation:
    1.  Change to the `owf-app-infomapper-ng/infomapper` folder.
    2.  `ng serve`
    3.  View the website in the web browser as [`http://localhost:4200`](http://localhost:4200).

#### Troubleshooting - Error Running `npm install` ####

If the following or similar is shown, make sure to run:

*   `npm install --legacy-peer-deps`
*   or: `npm install --force` (more heavy-handed)

This is needed because some dependencies have conflicting dependencies
(used in the image gallery and d3).
In this case forcing the dependencies works.
In the future if the conflict is more severe the software may need to be updated.

```
npm ERR! code ERESOLVE
npm ERR! ERESOLVE could not resolve
npm ERR!
npm ERR! While resolving: karma-jasmine-html-reporter@1.7.0
npm ERR! Found: jasmine-core@3.6.0
npm ERR! node_modules/jasmine-core
npm ERR!   dev jasmine-core@"~3.6.0" from the root project
npm ERR!   jasmine-core@"^3.6.0" from karma-jasmine@4.0.2
npm ERR!   node_modules/karma-jasmine
npm ERR!     dev karma-jasmine@"~4.0.0" from the root project
npm ERR!     peer karma-jasmine@">=1.1" from karma-jasmine-html-reporter@1.7.0
npm ERR!     node_modules/karma-jasmine-html-reporter
npm ERR!       dev karma-jasmine-html-reporter@"^1.5.0" from the root project
npm ERR!
npm ERR! Could not resolve dependency:
npm ERR! peer jasmine-core@">=3.8" from karma-jasmine-html-reporter@1.7.0
npm ERR! node_modules/karma-jasmine-html-reporter
npm ERR!   dev karma-jasmine-html-reporter@"^1.5.0" from the root project
npm ERR!
npm ERR! Conflicting peer dependency: jasmine-core@4.5.0
npm ERR! node_modules/jasmine-core
npm ERR!   peer jasmine-core@">=3.8" from karma-jasmine-html-reporter@1.7.0
npm ERR!   node_modules/karma-jasmine-html-reporter
npm ERR!     dev karma-jasmine-html-reporter@"^1.5.0" from the root project
npm ERR!
npm ERR! Fix the upstream dependency conflict, or retry
npm ERR! this command with --force, or --legacy-peer-deps
npm ERR! to accept an incorrect (and potentially broken) dependency resolution.
npm ERR!
npm ERR! See C:\Users\steve\AppData\Local\npm-cache\eresolve-report.txt for a full report.

npm ERR! A complete log of this run can be found in:
npm ERR!     C:\Users\steve\AppData\Local\npm-cache\_logs\2023-02-24T21_16_22_455Z-debug-0.log
```

#### Troubleshooting - 401 Unauthorized Error  ####

If the `npm install` (or `npm install --force`) command shows the following,
it is due to the authentication of the OWF shared library.
See the notes on ["Authenticate to GitHub Packages/npm..." discussion](https://github.com/OpenWaterFoundation/owf-app-dev-ng/tree/main/ng-workspace/projects/OpenWaterFoundation/common#publishing-the-common-library).

1.  `npm login --registry=https://npm.pkg.github.com --scope=OpenWaterFoundation`
2.  Enter the GitHub login name.
3.  Enter the GitHub developer personal access token (this is different from the 2FA access token).
    If expired,
    it may be necessary to use the GitHub website account ***Settings*** menu and then ***Developer settings***.
    Then use the ***Personal access tokens / Token (classic)*** selection and generate
    new token with `read:packages` selected if using the package and also `write:packages` if developing the library.
4.  Enter the email.

```
npm notice
npm ERR! code E401
npm ERR! 401 Unauthorized - GET https://npm.pkg.github.com/@OpenWaterFoundation%2fcommon - unauthenticated: User cannot be authenticated with the token provided.
```

### Development Tools ###

The development environment for this repository depends primarily on software tools used to process and view data,
including the following.  Install the software in normal default locations.

*   Git client:
    +   For example Git for Windows or Cygwin git.
*   InfoMapper - open source web application software to visualize data:
    +   See the [owf-app-infomapper-ng](https://github.com/OpenWaterFoundation/owf-app-infomapper-ng) repository for information.
    +   Currently must be cloned - will create an installer in the future.
    +   See [InfoMapper Configuration](#infomapper-configuration) section.
*   GeoProcessor - open source software for spatial data processing:
    +   Automates download and processing of spatial data.
    +   Command files (`*.gp`) in `process` folders indicate how to process spatial data and are
        committed to the repository.
    +   See the [GeoProcessor download page](http://software.openwaterfoundation.org/geoprocessor/).
*   QGIS - open source geographic information system:
    +   Install the "Standalone Installation" (rather than OSGeo4W suite)
        corresponding to the GeoProcessor version.
    +   QGIS may be used to review data and create preliminary project files (`*.qgs`) for prototype maps.
    +   See [OWF / Learn QGIS](http://learn.openwaterfoundation.org/owf-learn-qgis/) for information on installing QGIS.
*   TSTool - open source software for time series processing:
    +   Automates download and processing of time series data.
    +   Command files (`*.TSTool`) in `process` folders indicate how to process time series data and are
        committed to the repository.
    +   See the [TSTool download page](http://software.openwaterfoundation.org/)
        for installation information.
*   R - open source statistics software:
    +   Need to fill out if used for product generation, currently not used.
*   Python - open source scripting:
    +   Need to fill out if used for product generation, currently not used.

### InfoMapper Configuration ###

The InfoMapper is an Angular application, which expects run-time configuration and data files to be
located in `owf-app-infomapper-ng/infomapper/src/assets/app` repository working files.
The `app-default/` folder that is distributed with the InfoMapper software will be used if
the `app/` folder is not found or there is a major error initializing the application,
and is used to confirm basic application configuration.

Because the InfoMapper is a general application,
specific configuration and data for this information project cannot live in the InfoMapper repository.
Three options have been tested on Windows to provide custom configuration and data to the InfoMapper,
which applies to any implementation of the InfoMapper.

1.  Copy files from the implementation repository to the InfoMapper `assets/app` folder:
    *   This is typically be done with a script, either brute force to copy entire folder trees,
        or with options for selective copies.
    *   The downside is that files, perhaps many files, would need to be repeatedly copied, which can be slow
        and will require additional disk space.
        However, if the content is being updated incrementally,
        then it is not difficult to only copy the updated content.
    *   **This option is currently recommended on Windows because it does not require special configuration
        for windows to enable symbolic links, and because symbolic links on Windows do not seem to
        work propertly with Angular.**  The previous section describes using this approach.
2.  Use symbolic link(s) in the InforMappper files to allow the InfoMapper to access data without doing a copy,
    for example: `owf-app-infomapper-ng/infomapper/src/assets/app -> owf-infomapper-co-big-thompson/web`.
    *   All files live with the implementation repository and the InfoMapper `app` folder is in `.gitignore`.
        **This approach is desirable because published data live in the repository that is publishing the data
        and should be immediately detected by Angular when updated;
        however, it does not seem to work and is documented in a
        [Stack Overflow](https://stackoverflow.com/questions/62072054/angular-ng-serve-angular-cli-on-windows-cannot-find-assets-files-when-symbolic) article.**
    *   Requires activating Windows 10 features to use symbolic links
        (see [Symlinks in Windows, MinGW, Git, and Cygwin](https://www.joshkel.com/2018/01/18/symlinks-in-windows/)).
        +   Add to `~/.bashrc_profile` in Git Bash and Cygwin the following:  `export MSYS=winsymlinks:nativestrict`
        +   Add to `C:\ProgramData\Git\config` in the `core` section:  `symlinks=true`
        +   Can also run: `git config --system core.symlinks true` (but need to do above to have an effect)
    *   Requires confirming that symbolic links are working with all technologies involved,
        as indicated in the above article.
        It is recommended to create the symbolic links using Windows
        [mklink](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/mklink) command and
        confirming that other development environment tools work with links,
        in order to do the minimal amount of extra configuration.
    *   The `build-util/x-create-infomapper-symlinks.sh --files-live-here`
        script automates the above and has been tested with Git Bash.
3.  Similar to the above option but the symbolic link points in the opposite direction, for example:
    `owf-infomapper-co-big-thompson/web -> owf-app-infomapper-ng/infomapper/src/assets/app`.
    *   All files live with the InfoMapper and the `app` folder is in `.gitignore`.
    *   **This works but is undesirable due to issues noted below.  Hopefully the first option can be figured out and implemented.**
    *   See above for enabling symbolic links.
    *   The `build-util/x-create-infomapper-symlinks.sh --files-live-with-infomapper` script automates creating the symbolic link.
    *   Because `app` folder is git-ignored in the InfoMapper and the `dist/infomapper` symbolic link is git-ignored in
        this repository, any content that is static, such as `app-config.json` and `content-pages` must be saved in
        in this repository and copied to the `web/` linked folder.
        This is not ideal but is a work-around.
        Use the `web/x-copy-local-to-infomapper.sh` script to do this
    *   **This approach has been abandoned as too complicated.**

## Maintainers ##

This repository is maintained by Open Water Foundation staff.
