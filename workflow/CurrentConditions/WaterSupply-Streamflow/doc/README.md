# WaterSupply-StreamFlow/doc #

This folder contains files for the ***Water Supply - Streamflow*** product.

* [Introduction](#introduction)
* [Update Frequency](#update-frequency)
* [Datasets](#datasets)
* [Files](#files)
* [Workflow](#workflow)

-----------------------------

## Introduction ##

The ***Water Supply - Streamflow*** map indicates the locations of stream measurement stations in the basin,
with markers for different location types.
Links to station hydrographs are provided in popup data.

## Update Frequency ##

This product is currently updated infrequently, based on changes in the number of stations.
**In the future, this product will be updated frequently in order to summarize current streamflow conditions on the map.**

## Datasets ##

The following are datasets for the map.

| **Dataset** | **Description** | **Data Source** |
| -- | -- | -- |
| Telemetry stations | Telemetry stations are locations where real-time streamflow and diversion data are collected. | The data are queried from the [CDSS REST web services](https://dwr.state.co.us/rest/get/help#Datasets&#TelemetryStationsController&#gettingstarted&#jsonxml). |
| Source Water Route Framework (SWRF) | Stream linework with each stream corresponding to a single line. | Copy from [stream reaches product](../../../BasinEntities/Physical-StreamReaches/doc/README.md). |

## Files ##

The following files and folders are used.

| **File/Folder** | **Description** | **Repo Ignore** |
| -- | -- | -- |
| `.gitignore` | Indicates which files should be ignored in the repository. | |
| `01-download-stations.tstool` | TSTool command file to download data. | |
| `03-create-map-streamflow.gp` | GeoProcessor command file to create map. | |
| `doc/` | This `README.md` and related files. | |
| `downloads/` | Downloaded files. | Yes - for downloaded files. |
| `layers/` | Layers and supporting files used in the map. | Yes - for generated files. |
| `streamflow.json` | Map configuration file. | Yes |

## Workflow ##

The following describes the workflow steps, which should be run in the order shown to fully regenerate the information products.

| **Command File/Script** | **Software** | **Description** |
| -- | -- | -- |
| `01-download-stations.tstool` | TSTool | Download the telemetry stations and create GeoJSON files for different station types. |
| `03-create-map-streamflow.gp` | GeoProcessor | Create the map configuration file and copy map and layer files to the distribution folder. |
