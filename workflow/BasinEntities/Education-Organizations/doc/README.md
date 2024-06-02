# Education-Organizations/doc #

This folder contains files for the ***Education - Organizations*** product.

* [Introduction](#introduction)
* [Update Frequency](#update-frequency)
* [Datasets](#datasets)
* [Files](#files)
* [Workflow](#workflow)

-----------------------------

## Introduction ##

The ***Education - Organizations*** map indicates the locations of water education organizations in the Poudre Basin,
and relevant organizations outside the Poudre Basin boundary.
Education programs within other entities, such as water utilities, can be added when identified.

## Update Frequency ##

This product is updated infrequently,
based on changes in the dataset maintained with this information product.

## Datasets ##

The following are datasets for the map.

| **Dataset** | **Description** | **Data Source** |
| -- | -- | -- |
| Water Education Organizations | Inventory of water education entities in the Poudre Basin. | The current dataset was created by OWF as a prototype and will be expanded over time. |

## Files ##

The following files and folders are used.

| **File/Folder** | **Description** | **Repo Ignore** |
| -- | -- | -- |
| `02-create-education-layer.tstool` | TSTool command file to download data. | |
| `03-create-education-map.gp` | GeoProcessor command file to create map. |
| `doc/` | This `README.md` and related files. | |
| `downloads/` | Downloaded files. | Yes - for downloaded files. |
| `layers/` | Layers and supporting files used in the map. | Yes - for generated files. |
| `education-orgs.json` | Map configuration file. | Yes |

## Workflow ##

The following describes the workflow steps, which should be run in the order shown to fully regenerate the information products.

| **Command File/Script** | **Software** | **Description** |
| -- | -- | -- |
| `02-create-education-layer.gp` | TSTool | Create GeoJSON layer file from Excel input. |
| `03-create-education-map.gp` | GeoProcessor | Create the map configuration file and copy map and layer files to the distribution folder. |
