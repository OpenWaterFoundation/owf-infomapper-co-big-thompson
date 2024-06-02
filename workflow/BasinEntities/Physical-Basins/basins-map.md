# Map: Big Thompson Basins #

*   Overview
*   Comparison with Administrative and Other Basins
*   Layer Groups

-------------------

## Overview ##

The Big Thompson Basins map shows hydrologic basins, also called catchments.
Although there are multiple basin delineations available,
[Hydrologic Unit Maps](https://water.usgs.gov/GIS/huc.html) defined
by the United States Geological Survey (USGS) are widely used.
HUC basins use a Hydrologic Unit Code (HUC) to uniquely identify basins at various scales.
Headwater basins receive water only from their area,
while downstream basins receive local precipitation and the inflows from upstream basins.
Streams and rivers merge at confluences.
Elevation break lines and confluences help define basin boundaries,
and stream gages may be located at basin outflow points.
Basin boundaries typically focus on surface features,
although subsurface features may help define basins in some areas.

The USGS has been updating nationwide datasets for water,
involving water bodies and basins.
The use of "HUC" is still relevant and popular, and the term "Watershed Boundary Dataset (WBD)" is also used.

The HUC is a numerical code with 2 to 16 digits that uniquely identifies basins at different scale.
Two-digits are reserved at each scale level to provide additional granularity.
Note that this identification code is similar to the
[USGS approach used to identify stream sites](https://help.waterdata.usgs.gov/faq/sites/do-station-numbers-have-any-particular-meaning),
but is not the same number.
The following table lists the HUC identifiers that are relevant to the Big Thompson Basin.

| **HUC level (# of digits)** | **HUC for Big Thompson Basin** | **Basin Name** | **Comment** |
| -- | -- | -- | -- |
| 2 | `10` | `Missouri` | |
| 4 | `1019` | `Platte` | |
| 6 | `101900` | `Platte` | Same as HUC4. |
| 8 | `10190006` | `Big Thompson River` | Includes Colorado Water District 4. |
| 10 | `10190006xx` | Example: `North Fork Big Thompson River` | HUC8 subdivided into smaller basins. |
| 12 | `10190006xxxx` | Example: `West Creek` | HUC10 subdivided into smaller basins. |
| 14 | `10190006xxxxxx` | | No further subdivision - no data. |
| 16 | `10190006xxxxxxxx` | | No further subdivision - no data. |

## Comparison with Administrative and Other Basins ##

Hydrologic basins are typically determined from elevation data that defines the flow path for water.
Ridge lines define breaks between flow directions. Streams meet at confluence points that
define where small basins can be combined to create larger basins.

In contrast, administrative (see ***Basin Entities / Administrative - CO DWR Water Districts***)
and other basins, may have boundaries that correspond to political, operational, or other jurisdictions.
These boundaries may generally follow hydrologic basin boundaries in part,
and may also correspond to straight-line boundaries for counties, states, and other entities.
This unfortunately leads to complexities in data presentation and use.

To avoid confusion, it is important to pick basin boundaries that are relevant to the purpose
and scale of an analysis and visualization, and clearly indicate what the meaning of "basin"
is within the context of a discussion.
For example, the general term "Big Thompson River", "upper basin", "lower basin", etc. may be clear from the context,
or may need to be clarified by using more specific basin terminology such as
"DWR Water District 4", or "HUC 8 basin".

## Layer Groups ##

The following layer groups are included in this map.

| **Layer Group** | **Description** |
| -- | -- |
| Stream Reaches | Stream reaches within the basin. |
| Hydrologic Unit Code Basins | Hydrologic Unit Code (HUC) basins. |
| CO DWR Water Districts | Division of Water Resources water districts, to highlight the Big Thompson Basin (Water District 4).  See the [***Basin Entities / Administration - CO DWR Water Districts***](#map/entities-codwr-waterdistricts) map for more information. |
| Continental Divide | Continental divide line, to help understand transbasin issues. |
| Background Layers | Background layers that provide a frame of reference. |
