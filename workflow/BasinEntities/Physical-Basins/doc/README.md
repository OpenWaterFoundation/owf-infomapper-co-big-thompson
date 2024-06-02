# Physical-HUCs/doc #

This folder contains files for the ***Physical - Hydrologic Unit Codes*** product.

*   [Introduction](#introduction)
*   [Update Frequency](#update-frequency)
*   [Datasets](#datasets)
*   [Files](#files)
*   [Workflow](#workflow)

-----------------------------

## Introduction ##

The ***Physical - Hydrologic Unit Codes*** defines the hydrologic basins,
as polygons that define catchments.

## Update Frequency ##

This product is updated infrequently,
based on changes in United States Geological Survey (USGS) dataset.

## Datasets ##

The following are datasets for the map.

| **Dataset** | **Description** | **Data Source** |
| -- | -- | -- |
| Hydrologic Unit Code (HUC) | Hydrologic basin boundaries. | [Watershed Boundary Dataset (WDB)](ftp://rockyftp.cr.usgs.gov/vdelivery/Datasets/Staged/Hydrography/WBD/HU2/GDB/) accessed from [Hydrologic Unit Maps](https://water.usgs.gov/GIS/huc.html) web page. |

## Files ##

The following files and folders are used.

| **File/Folder** | **Description** | **Repo Ignore** |
| -- | -- | -- |
| `.gitignore` | Indicates which files should be ignored in the repository. | |
| `01-download-huc.gp` | GeoProcessor command file to download data. | |
| `03-create-hucs-map.gp` | GeoProcessor command file to create map. | |
| `doc/` | This `README.md` and related files. | |
| `downloads/` | Downloaded files. | Yes - for downloaded files. |
| `layers/` | Layers and supporting files used in the map. | Yes - for generated files. |
| `hucs-map.json` | Map configuration file. | Yes |

## Workflow ##

The following describes the workflow steps, which should be run in the order shown to fully regenerate the information products.

| **Command File/Script** | **Software** | **Description** |
| -- | -- | -- |
| `0a-download-huc.gp` | GeoProcessor | Download the HUC dataset from USGS FTP site and create GeoJSON layer file. |
| `03-create-hucs-map.gp` | GeoProcessor | Create the map configuration file and copy map and layer files to the distribution folder. |
