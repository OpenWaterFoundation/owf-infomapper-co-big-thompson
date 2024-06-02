# Layer: Counties #

The ***Counties*** layer contains all counties in Colorado, with context for Big Thompson Basin water supplies.

Counties on the map colored as follows:

| **Color** | **Description** |
| -- | -- |
| **<span style="color:#000000">Black</span>** | Big Thompson Basin outline. |
| **<span style="color:#003cb3">Blue</span>** | Counties that provide water to the Big Thompson Basin via transbasin diversions. |
| **<span style="color:#59b300">Dark green</span>** | Counties that physically intersect the Big Thompson Basin:  Larimer and Weld counties. |
| **<span style="color:#b3ff66; background-color:#999999">Light green</span>** | Counties that are within the South Platte basin and benefit from the Big Thompson directly or indirectly (**more detail will be added in the future**). |
| **<span style="color:#ffff00; background-color:#999999">Yellow</span>** | Counties that currently or in the future will benefit from transbasin diversions out of the Big Thompson Basin (**more detail will be added in the future**). |
| **<span style="color:#999999">Gray outline</span>** | Other counties. |

Popup graphs are available for county population.

## Data Sources ##

The following are data sources for this map:

| **Resource** | **Source** |
| -- | -- |
| County boundaries map layer. | [Counties in Colorado](https://data.openwaterfoundation.org/state/co/owf/counties/) dataset from the Open Water Foundation, created from [County Boundaries](https://data.colorado.gov/Transportation/Counties-in-Colorado/67vn-ijga) map layer dataset from Colorado Information Marketplace. |
| County annual population time series | [Colorado DOLA Population](https://data.openwaterfoundation.org/state/co/dola/population) dataset from the Open Water Foundation, created from State Demography Office (SDO) [population data](https://demography.dola.colorado.gov/assets/html/sdodata.html).  See the ***Basin Entities / Political - Counties*** map information. |

## Workflow

The workflow to create the map can be found in the [GitHub repository](https://github.com/OpenWaterFoundation/owf-infomapper-co-big-thompson/tree/master/workflow/BasinEntities/Political-Counties).
