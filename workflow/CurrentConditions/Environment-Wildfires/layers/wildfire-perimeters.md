# Layer: Current Year Wildfire Perimeters #

The Current Year Wildfire Perimeters layer contains all "current year to date" wildfires for Colorado,
as listed by the National Interagency Fire Center (NIFC).
The national layer is clipped to Colorado to limit the size of the layer.

## Data Sources ##

The following are data sources for this map.
The NIFC data layers and services are being updated to consolidate data from different sources.

| **Resource** | **Source** |
| -- | -- |
| Current Year Wildfire Perimeters. | [WFIGS - 2021 Wildfire Fire Perimeters to Date](https://data-nifc.opendata.arcgis.com/datasets/nifc::wfigs-2021-wildland-fire-perimeters-to-date/about) dataset from the National Interagency Fire Center (NIFC), Wildland Fire Interagency Geospatial Services (WFIGS) Group.  The Feature Web Service (FWS) is queried for Colorado and surrounding area in order to increase performance.  **Note that although the layer name includes 2021, the FWS uses general "CY" in the URL and may therefore apply in future years.** See also the [NIFC website](https://data-nifc.opendata.arcgis.com/), which explains the difference between datasets, and [list of NIFC datasets](https://data-nifc.opendata.arcgis.com/search?collection=Dataset). |

## Workflow ##

The workflow to create the map can be found in the [GitHub repository](https://github.com/OpenWaterFoundation/owf-infomapper-co-big-thompson/tree/master/workflow/CurrentConditions/Environment-Wildfires).
