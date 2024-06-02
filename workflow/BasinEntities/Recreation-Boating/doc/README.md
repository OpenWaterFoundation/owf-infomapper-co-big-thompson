# Recreation-BoatingOrganizations/doc #

This folder contains files for the ***Basin Entities / Recreation - Organizations*** product.

* [Introduction](#introduction)
* [Update Frequency](#update-frequency)
* [Datasets](#datasets)
* [Files](#files)
* [Workflow](#workflow)

-----------------------------

## Introduction ##

The ***Basin Entities / Recreation - Boating Organizations*** map indicates the locations of boating organizations in the Poudre Basin,
and relevant organizations outside the Poudre Basin boundary.

## Update Frequency ##

This product is updated infrequently,
based on changes in the dataset maintained with this information product.

## Datasets ##

The following are datasets for the map.

| **Dataset** | **Description** | **Data Source** |
| -- | -- | -- |
| Boating Organizations | Inventory of boating organizations in the Poudre Basin. | The current dataset was created by OWF as a prototype and will be expanded over time. |

## Files ##

The following files and folders are used.

| **File/Folder** | **Description** | **Repo Ignore** |
| -- | -- | -- |
| `data/` | Excel workbook for boating organizations. | |
| `02-create-boating-orgs-layer.tstool` | TSTool command file to create layer. | |
| `03-create-boating-orgs-map.gp` | GeoProcessor command file to create map. |
| `doc/` | This `README.md` and related files. | |
| `downloads/` | Downloaded files. | Yes - for downloaded files. |
| `layers/` | Layers and supporting files used in the map. | Yes - for generated files. |
| `boating-orgs.json` | Map configuration file. | Yes |

## Workflow ##

The following describes the workflow steps, which should be run in the order shown to fully regenerate the information products.

| **Command File/Script** | **Software** | **Description** |
| -- | -- | -- |
| `02-create-boating-orgs-layer.gp` | TSTool | Create GeoJSON layer file from Excel input. |
| `03-create-boating-orgs-map.gp` | GeoProcessor | Create the map configuration file and copy map and layer files to the distribution folder. |
