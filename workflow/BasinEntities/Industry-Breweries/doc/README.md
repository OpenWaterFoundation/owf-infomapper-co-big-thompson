# Industry-Breweries/doc #

This folder contains files for the ***Industry - Breweries*** product.

* [Introduction](#introduction)
* [Update Frequency](#update-frequency)
* [Datasets](#datasets)
* [Files](#files)
* [Workflow](#workflow)

-----------------------------

## Introduction ##

The ***Industry - Breweries*** map indicates the locations of breweries in the Poudre Basin.

## Update Frequency ##

This product is updated infrequently,
based on changes in Breweries dataset.

## Datasets ##

The following are datasets for the map.

| **Dataset** | **Description** | **Data Source** |
| -- | -- | -- |
| Breweries | Location of breweries in the Poudre Basin. | The current dataset was created by OWF as a prototype and focuses on Fort Collins Breweries.  The dataset needs to be updated to include more breweries throughout the Poudre Basin.  See the [`owf-data-co-breweries` GitHub repository](https://github.com/OpenWaterFoundation/owf-data-co-breweries). |

## Files ##

The following files and folders are used.

| **File/Folder** | **Description** | **Repo Ignore** |
| -- | -- | -- |
| `01-download-breweries.gp` | GeoProcessor command file to download data. | |
| `03-create-breweries-map.gp` | GeoProcessor command file to create map. |
| `doc/` | This `README.md` and related files. | |
| `downloads/` | Downloaded files. | Yes - for downloaded files. |
| `layers/` | Layers and supporting files used in the map. | Yes - for generated files. |
| `breweries.json` | Map configuration file. | Yes |

## Workflow ##

The following describes the workflow steps, which should be run in the order shown to fully regenerate the information products.

| **Command File/Script** | **Software** | **Description** |
| -- | -- | -- |
| `01-download-basins.gp` | GeoProcessor | Download the basins from OWF GitHub repository and rewrite to ensure latest GeoJSON format. |
| `03-create-breweries-map.gp` | GeoProcessor | Create the map configuration file and copy map and layer files to the distribution folder. |
