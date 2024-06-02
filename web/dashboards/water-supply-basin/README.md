# water-supply-basin

* [Folder Contents](#folder-contents)
* [Workflow to Create Dashboard Content](#workflow-to-create-dashboard-content)
* [Indicator Calculations](#indicator-calculations)

## Folder Contents

This folder contains files necessary to create the ***Water Supply (for Basin) Dashboard***.

The `*.tstool` files are [TSTool](https://opencdss.state.co.us/tstool/) command files,
which are run to automate data download and creation of files used by the website.
The most important files are described below.

| **File** | **Description** |
| -- | -- |
| `water-supply-basin-dashboard.json` | Configuration file to define the dashboard. See the [InfoMapper documentation](https://github.com/OpenWaterFoundation/owf-app-infomapper-ng-doc-user/tree/master/mkdocs-project/docs/appendix-adding-a-dashboard). |
| `download-drought-monitor.tstool` | Process the US Drought Monitor files for the water supply dashboard. |
| `download-reservoir-storage.tstool` | Process the NRCS AWDB web services reservoir storage for the water supply dashboard. |
| `download-streamflow.tstool` | Process the Colorado Division of Water Resources streamflow for the water supply dashboard. |
| `download-swsi.tstool` | Process the Colorado Information Marketplace (CIM) Surface Water Supply Index for the water supply dashboard. |
| `*classification.csv` | Classification files used to tell indicator what symbol to show. |
| `*template.tsp` | TSTool time series product file to describe charts, used by the TSTool software. |
| `*template.json` | TSTool time series product file to describe charts, output by TSTool and used by the InfoMapper software. |
| `downloads/` | Files that are downloaded during processing, ignored from the repository but may be used by the dashboard. |
| `results/` | Files that are created during processing, ignored from the repository but may be used by the dashboard. |

## Workflow to Create Dashboard Content

The water supply dashboard is configured by editing the `water-supply-basin-dashboard.json` file.
Widgets are configured to use data files created in these files.

The `*.tstool` files can be run in any order (no dependencies) using the
[TSTool software](https://opencdss.state.co.us/tstool/).

The workflows will first download data files into the `downloads` folder, typically `*.csv` files from web services.

The workflows then create files in the `results` folder, typically `*.csv` files that are used for the indicators
and `*.dv` files that contain "date value" format time series files used for charts in the web application.

The time series listed in TSTool results are used to create graphs.
Once a graph is configured, its configuration is saved in a `*.tsp` files.
These files are then processed using the `ProcessTSProduct` command in the command files,
which output equivalent `*.json` files that are used to describe the graph in a form that is used by InfoMapper software.

The `/web/copy-to-infomapper.sh` script is used to copy files into the Angular files for local viewing.

Refer to the `*.tstool` command files for comments that document the workflows for each dashboard widget,
including charts.

## Indicator Calculations

All indicators are treated as time series so that they can be visualized over time if desired.
The indicator widget displays the last value in the time series and the delta from the previous value to indicate direction of change.

The Surface Water Supply Index already contains an index that can be used for an indicator.
This index is based on nonexceedance probabilities of water supply from snowpack, reservoir storage, and streamflow forecast.

The US Drought Monitor provides drought conditions at different categories as the percent of basin area in each category.
The dashboard workflow converts this information into an area-weighted index,
which is a single number that can be used to look up an indicator status and symbol.

The reservoir storage time series is analyzed to determine a percent of median value for current conditions.
This value is used to look up the indicator status.

The streamflow time series is analyzed to determine a percent of median value for current daily average conditions.
This value is used to look up the indicator status.
