# Layer: Historical Wildfire Perimeters #

The Historical Wildfire Perimeters layer contains Historical wildfires for Colorado.
The national layer is clipped to Colorado and a surrounding buffer
for fires >= 150 acres and year >= 2000
to limit the size of the layer.

The effort to coordinate fire data between agencies is a challenge and a number of
"interagency" datasets and websites have been published in recent years and continue to evolve.
The following resources have been selected based on previous experience with the datasets,
which involves finding an appropriate layer when previously-available dataset is no longer available.
The primary need is for a map of historical wildfire boundaries with year and size of the event
for viewing and basic analysis.
Original data sources should be consulted if more complex analysis is required.

## Data Sources ##

The following are data sources for this map.

| **Resource** | **Source** |
| -- | -- |
| Historical Wildfire Perimeters layer. | [Interagency Fire Perimeter History - All Years View](https://data-nifc.opendata.arcgis.com/datasets/nifc::interagencyfireperimeterhistory-all-years-view/about) dataset from the National Interagency Fire Center.  The [Feature Web Service (FWS)](https://services3.arcgis.com/T4QMspbfLg3qTGWY/arcgis/rest/services/InteragencyFirePerimeterHistory_All_Years_View/FeatureServer/0/query) is queried.<p>The Wildland Fire Interagency Geospatial Services (WFIGS) Group is in the process of creating the [WFIGS - Wildland Fire Perimeters Full History](https://data-nifc.opendata.arcgis.com/datasets/nifc::wfigs-wildland-fire-perimeters-full-history/about).  However, as of 2022-07-05 it is not clear whether this is an active effort.  The new layer may be used in the future when and if the full history is available.</p> |

## Workflow ##

The workflow to create the map can be found in the
[GitHub repository](https://github.com/OpenWaterFoundation/owf-infomapper-co-big-thompson/tree/master/workflow/CurrentConditions/Environment-Wildfires).
