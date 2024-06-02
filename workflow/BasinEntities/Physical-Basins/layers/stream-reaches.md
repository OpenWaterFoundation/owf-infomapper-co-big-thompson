# Layer: Stream Reaches #

The ***Stream Reaches*** layer contains linework for physical streams in the basin.

*   Overview
*   Data Sources
*   Map Creation Workflow

---

## Overview ##

The ***Stream Reaches*** layer features were extracted from statewide
Source Water Route Framework (SWRF) layer, developed by the Colorado Division of Water Resources.
This layer uses linework from the
[National Hydrography Dataset (NHD)](https://www.usgs.gov/core-science-systems/ngp/national-hydrography/national-hydrography-dataset?qt-science_support_page_related_con=0#qt-science_support_page_related_con).
However, whereas NHD linework is composed of many segments created during map digitization,
the SWRF layer is composed of longer lines that each correspond to a named stream.
For example, the Big Thompson mainstem is a single line from the confluence of its upstream reaches to the
downstream confluence with the South Platte River.
See the [Source Water Route Framework And Stream Mile Processing](https://dnrweblink.state.co.us/dwr/DocView.aspx?dbid=0&id=3652914&page=1&searchid=cb53d6e2-bb6f-4a93-887a-dd9ce6413168&cr=1)
memorandum from the Colorado Division of Water Resources.

The SWRF layer includes `GNIS_ID` and `GNIS_Name` attributes, which correspond to the national
[Geographic Names Information System (GNIS)](https://www.usgs.gov/faqs/what-geographic-names-information-system-gnis?qt-news_science_products=0#qt-news_science_products)
features.

The SWRF layer also includes the concept of stream mile (measured upstream from state line or confluence).
The State of Colorado's HydroBase database includes stream mile for structures, stations,
and other data, which are also added as attributes in spatial datasets.
This allows creating datasets and tools that use the stream mile for reference and analysis.

## Data Sources ##

The following are data sources for this layer:

| **Resource** | **Source** |
| -- | -- |
| Stream Reaches layer | [Colorado Stream Reaches dataset](https://data.openwaterfoundation.org/state/co/dwr/stream-reaches/) from the Open Water Foundation, created from the [Colorado's Decision Support Systems](https://www.colorado.gov/pacific/cdss/gis-data-category) Source Water Route Framework. |

## Map Creation Workflow ##

The workflow to process the data can be found in the
[GitHub repository](https://github.com/OpenWaterFoundation/owf-infomapper-big-thompson/tree/master/workflow/BasinEntities/Physical-StreamReaches).
