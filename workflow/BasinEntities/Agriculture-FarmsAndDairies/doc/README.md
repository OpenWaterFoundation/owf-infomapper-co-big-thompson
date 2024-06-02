# Agriculture-FoodAndDairies/doc #

This folder contains files for the ***Agriculture - Food and Dairies*** map.

* [Introduction](#introduction)
* [Update Frequency](#update-frequency)
* [Datasets](#datasets)
* [Files](#files)
* [Workflow](#workflow)

-----------------------------

## Introduction ##

The ***Agriculture - Food and Dairies*** map indicates the locations of local food production and dairies in the Poudre Basin,
not large-scale farms.

## Update Frequency ##

This product is updated infrequently,
based on changes in dairies dataset.

## Datasets ##

The following are datasets for the map.

| **Dataset** | **Description** | **Data Source** |
| -- | -- | -- |
| Dairies | Location of dairies in the Poudre Basin. | The current dataset was created by OWF as a prototype and focuses on Fort Collins dairies.  The dataset needs to be updated to include more dairies throughout the Poudre Basin.  See the [`owf-data-co-dairies` GitHub repository](https://github.com/OpenWaterFoundation/owf-data-co-dairies). |

## Files ##

The following files and folders are used.

| **File/Folder** | **Description** | **Repo Ignore** |
| -- | -- | -- |
| `.gitignore` | Indicates which files should be ignored in the repository. | |
| `01-download-dairies.gp` | GeoProcessor command file to download data. | |
| `03-create-food-and-dairies-map.gp` | GeoProcessor command file to create map. |
| `doc/` | This `README.md` and related files. | |
| `downloads/` | Downloaded files. | Yes - for downloaded files. |
| `layers/` | Layers and supporting files used in the map. | Yes - for generated files. |
| `food-and-dairies.json` | Map configuration file. | Yes |

## Workflow ##

The following describes the workflow steps, which should be run in the order shown to fully regenerate the information products.

| **Command File/Script** | **Software** | **Description** |
| -- | -- | -- |
| `01-download-basins.gp` | GeoProcessor | Download the basins from OWF GitHub repository and rewrite to ensure latest GeoJSON format. |
| `03-create-food-and-dairies-map.gp` | GeoProcessor | Create the map configuration file and copy map and layer files to the distribution folder. |
