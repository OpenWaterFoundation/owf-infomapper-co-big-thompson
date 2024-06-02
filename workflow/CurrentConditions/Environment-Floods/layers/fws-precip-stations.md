# Layer: Flood Warning Precipitation Stations #

The Flood Warning System (FWS) precipitation stations layer contains flood warning precipitation stations for the Big Thompson Basin
and Northern Colorado region,
used to display basic current conditions information and provide links to the FWS station dashboards.

Characteristics of precipitation stations are as follows:

*   return precipitation data types
*   may also collect other data types such as water level if located near a stream
    (Fort Collins flood warning system stations typically do not collect water level)
*   typically use a tipping bucket sensor that reports every .01 inch or 1mm tip
*   may be taken out of service in cold weather to protect the sensors from freezing

The map marker is color coded for general precipitation levels.
**The criteria is more general than the Flood Warning System.**
The [Larimer County Flood Warning System](https://larimerco-ns5.trilynx-novastar.systems/novastar/operator/)
provides features to view data and alarm conditions,
including precipitation alarms based on precipitation duration frequency levels (i.e., 10-year storm).

## Data Sources ##

The following are data sources for this map:

| **Resource** | **Source** |
| -- | -- |
| Flood Warning Precipitation Stations | Larimer County FWS data web services. |

## Workflow ##

The workflow to create the map can be found in the
[GitHub repository](https://github.com/OpenWaterFoundation/owf-infomapper-co-big-thompson/tree/master/workflow/CurrentConditions/Environment-Floods).
