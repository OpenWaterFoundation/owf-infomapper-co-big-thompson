# WaterSupply-WaterProviders/doc #

This folder contains files for the ***Water Supply - Water Providers*** product.

* [Introduction](#introduction)
* [Update Frequency](#update-frequency)
* [Datasets](#datasets)
* [Files](#files)
* [Workflow](#workflow)

-----------------------------

## Introduction ##

The ***Water Supply - Water Providers*** map indicates the locations of water providers in the Poudre Basin,
focusing on treated water providers.

## Update Frequency ##

This product is updated infrequently,
based on changes in water providers dataset that is maintained by OWF.

## Datasets ##

The following are datasets for the map.

| **Dataset** | **Description** | **Data Source** |
| -- | -- | -- |
| Water Providers | Location of water providers in the Poudre Basin. | The current statewide dataset was created by OWF for R&D and projects.  See the [`owf-data-co-municipal-water-providers` GitHub repository](https://github.com/OpenWaterFoundation/owf-data-co-municipal-water-providers). |

## Files ##

The following files and folders are used.

| **File/Folder** | **Description** | **Repo Ignore** |
| -- | -- | -- |
| `01-download-water-providers.gp` | GeoProcessor command file to download data. | |
| `03-create-water-providers-map.gp` | GeoProcessor command file to create map. |
| `doc/` | This `README.md` and related files. | |
| `downloads/` | Downloaded files. | Yes - for downloaded files. |
| `layers/` | Layers and supporting files used in the map. | Yes - for generated files. |
| `water-providers.json` | Map configuration file. | Yes |

## Workflow ##

The following describes the workflow steps, which should be run in the order shown to fully regenerate the information products.

| **Command File/Script** | **Software** | **Description** |
| -- | -- | -- |
| `01-download-water-providers.gp` | GeoProcessor | Download the water providers from OWF GitHub repository and rewrite to ensure latest GeoJSON format. |
| `03-create-water-providers-map.gp` | GeoProcessor | Create the map configuration file and copy map and layer files to the distribution folder. |
