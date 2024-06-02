# WaterQuality-Monitoring/doc #

This folder contains files for the ***Water Quality - Monitoring*** product.

* [Introduction](#introduction)
* [Update Frequency](#update-frequency)
* [Datasets](#datasets)
* [Files](#files)
* [Workflow](#workflow)

-----------------------------

## Introduction ##

The ***Water Quality - Monitoring*** map indicates the locations of water quality monitoring the Poudre Basin,
which may include source waters and downstream from wastewater treatment and other uses.

## Update Frequency ##

This product is updated infrequently,
based on changes in water quality monitoring datasets, such as addition of new stations.

## Datasets ##

The following are datasets for the map.

| **Dataset** | **Description** | **Data Source** |
| -- | -- | -- |
| Upper Poudre Monitoring| Location of water quality monitoring sites in the Poudre Basin. | Data was provided by Fort Collins Utilities. |

## Files ##

The following files and folders are used.

| **File/Folder** | **Description** | **Repo Ignore** |
| -- | -- | -- |
| `03-create-wq-monitoring-map.gp` | GeoProcessor command file to create map. |
| `doc/` | This `README.md` and related files. | |
| `downloads/` | Downloaded files. | Yes - for downloaded files. |
| `layers/` | Layers and supporting files used in the map. | Yes - for generated files. |
| `wq-monitoring-map.json` | Map configuration file. | Yes |

## Workflow ##

The following describes the workflow steps, which should be run in the order shown to fully regenerate the information products.

| **Command File/Script** | **Software** | **Description** |
| -- | -- | -- |
| `03-create-wq-monitoring-map.gp` | GeoProcessor | Create the map configuration file and copy map and layer files to the distribution folder. |
