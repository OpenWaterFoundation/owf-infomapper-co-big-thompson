# Map: Flood Conditions #

| [Larimer County Emergency Alerts](https://nocoalert.org/) | [Larimer County Flood Warning System](https://larimerco-ns5.trilynx-novastar.systems/novastar/operator/) | [NWS Weather Story](https://www.weather.gov/bou/weatherstory) |
| -- | -- |

*   Overview
*   Flood Warning Systems
*   Protection and Restoration
*   Layer Groups

--------------

## Overview ##

The ***Flood Conditions*** map provides information about current flood conditions
and other flood-related information for the Big Thompson Basin and surrounding region.

Flooding can occur for various reasons including rain events, rapid snowmelt events,
rain on snow events,
infrastructure failure, or a combination of causes.
The magnitude of a flood can also vary from neighborhood to region,
depending on the amount of water and local physical conditions.
For example, small localized rain events may lead to full street gutters and flooded intersections
without causing streams to significantly rise.
Flooding events may be highly localized or regional.

Flooding impacts may be made worse by additional hazards,
such as debris carried in the water, which can cause damming behind bridges, culverts, and other structures.
Flood water may also carry contaminants such as petroleum products, septic system and sewer waste,
and chemicals.

Although there may be opportunities to capture flood water and use for water supply,
such as agricultural irrigation and municipal raw water supply, the high flows, debris,
and contaminants experienced during flooding events can pose challenges to using flood water for water supply.

High flows can benefit the environment by removing sediment via flushing flows,
distribute water to riverine ecosystems, and perform processes that are beneficial to the river.
However, sediment that is removed from one area may be deposited in other areas and
river channel may be reconfigured, which has impacts.

Flood control detention ponds, reservoirs, and other storage do provide an opportunity to capture flood water
so that it can be managed over time.
However, water rights laws control the amount of time that flood water can be retained and how the water can be used.
This is because flood water is part of a shared system and the right to use the water is controlled by water law.

This map focuses on providing access to real-time flood warning information.
**Flood warning system websites provide more detailed information about current and historical flood conditions
and should be consulted to understand current flooding conditions.**

### Flood Warning Systems ##

Flood Warning Systems (FWS) provide near real-time information for situational awareness to support
emergency management decision-making.
FWS stations are often located in remote areas and data may need to be collected using radio and satellite communications.
Consequently, bandwidth is limited and FWS typically collect data only when an event results in conditions
that change enough to trigger a transmission.
Measurements may be made "continuously" at the station's sensors,
but data reports are not transmitted continously.
FWS stations also typically transmit a "regular report" on an interval (for example once an hour or every 24 hours)
to ensure that there is a reasonable historical record.

FWS stations often implement the ALERT2 protocol, which uses a 1 or 2-minute cycling time frame for transmitting data,
where stations each have the chance to report once a cycle.
The above conventions means that a station will typically transmit event data within 2 minutes of measurement.
The data management system and website will typically display data within 5 minutes due to the time needed for
communication and other processes.
Data requests by software may received cached results to ensure that many data requests reuse data products
and minimize the load on the system.

FWS are typically implemented regionally,
for example for a city, county, special district or other entity,
with different entities being responsible for each system.
Multiple systems may overlap and "listen" to the same stations.
This redundancy ensures that multiple data sources are available during events.
The following table provides links to publicly-accessible flood warning systems that provide data for the Big Thompson Basin.
Stations typically collect precipitation data and may also collect other data types such as air temperature,
water level, discharge, and water quality.
Implementing stations that measure water level and discharge requires additional effort and cost.

| **Flood Warning System** | **Description** |
| -- | -- |
| [Larimer County Flood Warning System](https://larimerco-ns5.trilynx-novastar.systems/novastar/operator/) | Regional flood warning system including Larimer and Weld counties. The website uses NovaStar software and is supported by [TriLynx Systems](https://trilynx.systems/) and [Water and Earth Technologies](https://www.wetec.us/).  These companies collaborate with the [Open Water Foundation](https://openwatefoundation.org) on the Big Thompson Basin Information Website. All of these organizations are located in the Fort Collins area. |
| [Fort Collins Flood Warning System](https://gisweb.fcgov.com/HTML5Viewer/Index.html?viewer=Flood%20Warning) | Flood warning system maintained by For Collins.  See also the main [Flood Warning System](https://www.fcgov.com/utilities/what-we-do/stormwater/flooding/warning-system) web page. Fort Collins FWS stations typically measure precipitation but not water level. |

## Protection and Restoration ##

The following table provides information about important flood protection and restoration organizations in the Big Thompson Basin.

| **Organization** | **Description** |
| -- | -- |
| [Coalition for the Poudre River Watershed (CPRW)](https://www.poudrewatershed.org/) | Mission:  To improve and maintain the ecological health of the Poudre River Watershed through community collaboration. |

## Layer Groups ##

The following layer groups are included in this map.

| **Layer Group** | **Description** |
| -- | -- |
| Flood Warning Precipitation Stations | Flood warning system (FWS) precipitation monitoring stations showing precipitation totals for useful intervals. Stations are retrieved from the Larimer County regional FWS.  See the [NovaStar Operator website](https://larimerco-ns5.trilynx-novastar.systems/novastar/operator/). |
| Flood Warning Water Level Stations | Flood warning system (FWS) water level monitoring stations. Stations are retrieved from the Larimer County regional FWS.  See the [NovaStar Operator website](https://larimerco-ns5.trilynx-novastar.systems/novastar/operator/). |
| Flood Organizations | Organizations that have floodplain regulation and control responsibilities, including stormwater utilities and districts. |
| Stream Reaches | Stream lines for named streams and rivers. See also the [***Basin Entities / Physical - Stream Reaches***](#map/entities-stream-reaches) map. |
| Hydrologic Unit Code (HUC) Basins | Basins that correspond to stream reaches and are often used when describing flood warnings, wildfire conditions, etc. See also the [***Basin Entities / Physical - Bassins***](#map/entities-basins) map. |
| Soil Burn Severity | Burn severity assessment from Burn Area Emergency Response (BAER). See also the [***Current Conditions / Environment - Wildfires***](#map/current-wildfires) map. |
| Wildfires | Current and historical wildfire perimeters.  See also the [***Current Conditions / Environment - Wildfires***](#map/current-wildfires) map. |
| Snowpack | Current conditions for snowpack.  See also the [***Current Conditions / Water Supply - Snowpack***](#map/current-snowpack) map. |
| National Parks | National parks impacted by wildfires and flooding. |
| Continental Divide | Continental divide, illustrating a geological boundary between basins. |
| CO DWR Water Districts | Division of Water Resources water districts, to highlight the Big Thompson Basin (Water District 4).  See the [***Basin Entities / Administration - CO DWR Water Districts***](#map/entities-codwr-waterdistricts) map for more information. |
| Background Layers | Background layers that provide a frame of reference. |
