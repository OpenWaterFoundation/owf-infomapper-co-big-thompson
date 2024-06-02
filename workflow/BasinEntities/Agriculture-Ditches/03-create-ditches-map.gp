# Create a GeoMapProject file for Big Thompson Basin Ditch service areas
# - read the previously downloaded layer file
# - output to the web folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/BasinEntities/Agriculture-Ditches")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  DitchesProject
# - GeoMapID:  DitchesMap
CreateGeoMapProject(NewGeoMapProjectID="DitchesProject",ProjectType="SingleMap",Name="Ditches",Description="Ditch service areas and canals.",Properties="author:'Open Water Foundation',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="DitchesMap",Name="Ditches",Description="Ditch service areas and canals from CDSS.",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.4,40.43,10',docPath:'ditches-map.md'")
AddGeoMapToGeoMapProject(GeoMapProjectID="DitchesProject",GeoMapID="DitchesMap")
# = = = = = = = = = =
# Background layers:  read layers and add a layer view group
# GeoLayerViewGroupID: BackgroundGroup
# - add tile servers from MapBox, Esri, and Google
#
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground: true, selectedInitial: true")
#
# Mapbox background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxSatelliteLayer",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxSatelliteLayer",GeoLayerViewID="MapBoxSatelliteLayerView",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="selectedInital: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreetsLayer",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreetsLayer",GeoLayerViewID="MapBoxStreetsLayerView",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/v4/mapbox.streets-satellite/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreets&SatelliteLayer",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreets&SatelliteLayer",GeoLayerViewID="MapBoxStreets&SatelliteLayerView",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/masforce/cjs108qje09ld1fo68vh7t1he/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFzZm9yY2UiLCJhIjoiY2pzMTA0bmR5MXAwdDN5bnIwOHN4djBncCJ9.ZH4CfPR8Q41H7zSpff803g",GeoLayerID="MapBoxTopographicLayer",Name="Topographic (MapBox)",Description="Topographic background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxTopographicLayer",GeoLayerViewID="MapBoxTopographicLayerView",Name="Topographic (MapBox)",Description="Topographic Map",Properties="selectedInitial: false")
#
# Esri background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Dark_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriDarkGray",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriDarkGray",GeoLayerViewID="EsriDarkGrayView",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="selectedInitial: false,separatorBefore:true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriImagery",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriImagery",GeoLayerViewID="EsriImageryView",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriLightGray",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriLightGray",GeoLayerViewID="EsriLightGrayView",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriNationalGeographic",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriNationalGeographic",GeoLayerViewID="EsriNationalGeographicView",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriShadedRelief",Name="Shaded Relief (Esri)",Description="Shaded Relief background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriShadedRelief",GeoLayerViewID="EsriShadedReliefView",Name="Shaded Relief (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriStreets",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriStreets",GeoLayerViewID="EsriStreetsView",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTerrain",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTerrain",GeoLayerViewID="EsriTerrainView",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTopographic",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTopographic",GeoLayerViewID="EsriTopographicView",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="selectedInitial: false")
#
# Google background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s&x={x}&y={y}&z={z}",GeoLayerID="GoogleSatellite",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleSatellite",GeoLayerViewID="GoogleSatelliteView",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="selectedInitial: false,separatorBefore:true")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",GeoLayerID="GoogleStreets",Name="Streets (Google)",Description="Streets background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleStreets",GeoLayerViewID="GoogleStreetsView",Name="Streets (Google)",Description="Streets background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}",GeoLayerID="GoogleHybrid",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleHybrid",GeoLayerViewID="GoogleHybridView",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="selectedInitial: true")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=p&x={x}&y={y}&z={z}",GeoLayerID="GoogleTerrain",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleTerrain",GeoLayerViewID="GoogleTerrainView",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="selectedInitial: false")
# Other
ReadRasterGeoLayerFromTileMapService(InputUrl="https://basemap.nationalmap.gov/ArcGIS/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}",GeoLayerID="USGSTopo",Name="USGS Topo (USGS)",Description="Topo background map from USGS.",Properties="attribution: 'USGS',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="USGSTopo",GeoLayerViewID="USGSTopoView",Name="USGS Topo (USGS)",Description="USGS Topo background map from USGS.",Properties="selectedInitial: false,separatorBefore:true")
# = = = = = = = = = =
# Water district 4:  read layer and add to layer view group.
# GeoLayerViewGroupID: WaterDistrictsGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="WaterDistrictsGroup",Name="CO DWR Water Districts",Description="Water District boundaries from the Colorado Division of Water Resources.",Properties="selectedInitial: true",InsertPosition="Top")
#
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4.md",DestinationFile="layers/co-dwr-water-district-4.md")
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4-classify-district.csv",DestinationFile="layers/co-dwr-water-district-4-classify-district.csv")
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dwr/districts/co-dwr-district-4.geojson",GeoLayerID="WaterDistrictLayer",Name="CO DWR Water District 4",Description="Water District 4 boundary from the Colorado Division of Water Resources.")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDistrictLayer",GeoLayerViewID="WaterDistrictLayerView",Name="CO DWR Water District 4",Description="Water District 4 boundary from the Colorado Division of Water Resources",InsertPosition="Top",Properties="docPath:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4.md")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="WaterDistrictLayerView",Name="Colorize district",Description="Show Water District 4 in black.",ClassificationAttribute="DISTRICT",Properties="classificationFile:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4-classify-district.csv")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterDistrictLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterDistrictLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4-event-config.json")
# = = = = = = = = = =
# Soil Conservation Districts
# = = = = = = = = = =
# - color is orange
# GeoLayerViewGroupID: SoilConservationDistrictsGoup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="SoilConservationDistrictsGoup",Name="Soil Conservation Districts",Description="Soil conservation districts from DOLA.",Properties="selectedInitial: true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dola/district-boundaries/latest/co-soil-conservation-districts-waterdistrict4.geojson",GeoLayerID="SoilConservationDistrictsLayer",Name="Soil Conservation Districts",Description="Soil conservation districts from DOLA.")
# OK to show by default since renders OK with ditch service areas.
AddGeoLayerViewToGeoMap(GeoLayerID="SoilConservationDistrictsLayer",GeoLayerViewID="SoilConservationDistrictsLayerView",Name="Soil Conservation Districts",Description="Soil conservation districts from DOLA",InsertPosition="Top",Properties="docPath:layers/soil-conservation-districts.md,selectedInitial:true,highlightEnabled:true")
# Color is a brownish orange.
SetGeoLayerViewSingleSymbol(GeoLayerViewID="SoilConservationDistrictsLayerView",Name="Soil Conservation Districts",Description="Soil conservation districts from DOLA",Properties="color:#cc8500,opacity:1.0,fillColor:#cc8500,fillOpacity:0.3,weight:2")
SetGeoLayerViewEventHandler(GeoLayerViewID="SoilConservationDistrictsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/soil-conservation-districts-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="SoilConservationDistrictsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/soil-conservation-districts-event-config.json")
# = = = = = = = = = =
# Ditch service areas
# - select the most recent for initial view, others are not selected
# = = = = = = = = = =
# Ditch service areas (1956):  read layer and add to a layer view group.
# - color is yellow
# GeoLayerViewGroupID: DitchServiceAreasGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="DitchServiceAreasGroup",Name="Ditch Service Areas",Description="Ditch service areas from Colorado's Decision Support System.",Properties="selectedInitial: true,docPath:'layers/group-ditch-service-areas.md'",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dwr/irrigated-lands/co-dwr-ditch-service-area-district4-1956.geojson",GeoLayerID="DitchServiceAreas1956Layer",Name="Ditch Service Areas",Description="Ditch service areas (1956) for District 4 from Colorado's Decision Support Systems.")
# The following layer view group is used for all years
AddGeoLayerViewToGeoMap(GeoLayerID="DitchServiceAreas1956Layer",GeoLayerViewID="DitchServiceAreas1956LayerView",Name="District 4 Ditch Service Areas (1956)",Description="Ditch service areas (1956) from CDSS",InsertPosition="Top",Properties="docPath:layers/ditch-service-areas.md,selectedInitial:false,highlightEnabled:true")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="DitchServiceAreas1956LayerView",Name="Ditch Service Areas",Description="Ditch Service Areas",Properties="color:#ffff00,opacity:1.0,fillColor:#ffff00,fillOpacity:0.3,weight:2")
SetGeoLayerViewEventHandler(GeoLayerViewID="DitchServiceAreas1956LayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/ditch-service-areas-1956-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="DitchServiceAreas1956LayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/ditch-service-areas-1956-event-config.json")
# = = = = = = = = = =
# Ditch service areas (1976):  read layer and add to a layer view group.
# - color is orange
# GeoLayerViewGroupID: DitchServiceAreasGroup
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dwr/irrigated-lands/co-dwr-ditch-service-area-district4-1976.geojson",GeoLayerID="DitchServiceAreas1976Layer",Name="Saint Vrain Ditch Service Areas (1976)",Description="Ditch service areas (1976) for District 4 from Colorado's Decision Support Systems.")
AddGeoLayerViewToGeoMap(GeoLayerID="DitchServiceAreas1976Layer",GeoLayerViewID="DitchServiceAreas1976LayerView",Name="District 4 Ditch Service Areas (1976)",Description="Ditch service areas (1976) from CDSS",InsertPosition="Top",Properties="docPath:layers/ditch-service-areas.md,selectedInitial:false,highlightEnabled:true")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="DitchServiceAreas1976LayerView",Name="Ditch Service Areas",Description="Ditch Service Areas",Properties="color:#ff6600,opacity:1.0,fillColor:#ff6600,fillOpacity:0.3,weight:2")
SetGeoLayerViewEventHandler(GeoLayerViewID="DitchServiceAreas1976LayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/ditch-service-areas-1976-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="DitchServiceAreas1976LayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/ditch-service-areas-1976-event-config.json")
# = = = = = = = = = =
# Ditch service areas (1987):  read layer and add to a layer view group.
# - color is cyan
# GeoLayerViewGroupID: DitchServiceAreasGroup
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dwr/irrigated-lands/co-dwr-ditch-service-area-district4-1987.geojson",GeoLayerID="DitchServiceAreas1987Layer",Name="Saint Vrain Ditch Service Areas (1987)",Description="Ditch service areas (1987) for District 4 from Colorado's Decision Support Systems.")
AddGeoLayerViewToGeoMap(GeoLayerID="DitchServiceAreas1987Layer",GeoLayerViewID="DitchServiceAreas1987LayerView",Name="District 4 Ditch Service Areas (1987)",Description="Ditch service areas (1987) from CDSS",InsertPosition="Top",Properties="docPath:layers/ditch-service-areas.md,selectedInitial:false,highlightEnabled:true")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="DitchServiceAreas1987LayerView",Name="Ditch Service Areas",Description="Ditch Service Areas",Properties="color:#00ffff,opacity:1.0,fillColor:#00ffff,fillOpacity:0.3,weight:2")
SetGeoLayerViewEventHandler(GeoLayerViewID="DitchServiceAreas1987LayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/ditch-service-areas-1987-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="DitchServiceAreas1987LayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/ditch-service-areas-1987-event-config.json")
# = = = = = = = = = =
# Ditch service areas (2001):  read layer and add to a layer view group.
# - color is light green
# GeoLayerViewGroupID: DitchServiceAreasGroup
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dwr/irrigated-lands/co-dwr-ditch-service-area-district4-2001.geojson",GeoLayerID="DitchServiceAreas2001Layer",Name="Saint Vrain Ditch Service Areas (2001)",Description="Ditch service areas (2001) for District 4 from Colorado's Decision Support Systems.")
AddGeoLayerViewToGeoMap(GeoLayerID="DitchServiceAreas2001Layer",GeoLayerViewID="DitchServiceAreas2001LayerView",Name="District 4 Ditch Service Areas (2001)",Description="Ditch service areas (2001) from CDSS",InsertPosition="Top",Properties="docPath:layers/ditch-service-areas.md,selectedInitial:false,highlightEnabled:true")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="DitchServiceAreas2001LayerView",Name="Ditch Service Areas",Description="Ditch Service Areas",Properties="color:#b3ff66,opacity:1.0,fillColor:#b3ff66,fillOpacity:0.3,weight:2")
SetGeoLayerViewEventHandler(GeoLayerViewID="DitchServiceAreas2001LayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/ditch-service-areas-2001-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="DitchServiceAreas2001LayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/ditch-service-areas-2001-event-config.json")
# = = = = = = = = = =
# Ditch service areas (2005):  read layer and add to a layer view group.
# - color is green
# GeoLayerViewGroupID: DitchServiceAreasGroup
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dwr/irrigated-lands/co-dwr-ditch-service-area-district4-2005.geojson",GeoLayerID="DitchServiceAreas2005Layer",Name="Saint Vrain Ditch Service Areas (2005)",Description="Ditch service areas (2005) for District 4 from Colorado's Decision Support Systems.")
AddGeoLayerViewToGeoMap(GeoLayerID="DitchServiceAreas2005Layer",GeoLayerViewID="DitchServiceAreas2005LayerView",Name="District 4 Ditch Service Areas (2005)",Description="Ditch service areas (2005) from CDSS",InsertPosition="Top",Properties="docPath:layers/ditch-service-areas.md,selectedInitial:true,highlightEnabled:true")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="DitchServiceAreas2005LayerView",Name="Ditch Service Areas",Description="Ditch service areas",Properties="color:#33cc33,opacity:1.0,fillColor:#33cc33,fillOpacity:0.3,weight:2")
SetGeoLayerViewEventHandler(GeoLayerViewID="DitchServiceAreas2005LayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/ditch-service-areas-2005-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="DitchServiceAreas2005LayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/ditch-service-areas-2005-event-config.json")
# = = = = = = = = = =
# Stream reaches:  read layer and add to a layer view group.
# GeoLayerViewGroupID: StreamReachesGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="StreamReachesGroup",Name="Stream Reaches",Description="Stream reaches",Properties="selectedInitial:true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dwr/stream-reaches/co-stream-reaches-district4.geojson",GeoLayerID="StreamReachesLayer",Name="Stream Reaches",Description="Stream reaches")
AddGeoLayerViewToGeoMap(GeoLayerID="StreamReachesLayer",GeoLayerViewID="StreamReachesLayerView",Name="Stream Reaches",Description="Stream reaches",Properties="docPath:../Physical-StreamReaches/layers/stream-reaches.md,highlightEnabled:true")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="StreamReachesLayerView",Name="Stream Reaches",Description="Stream reaches",Properties="color:#6297f7,width:2")
#SetGeoLayerViewSingleSymbol(GeoLayerViewID="StreamReachesLayerView",Name="Stream Reaches",Description="Stream reaches")
#SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="StreamReachesLayerView",Name="Stream Reaches",Description="Show stream reaches is blue lines",ClassificationAttribute="county",Properties="classificationType:'SingleSymbol'")
SetGeoLayerViewEventHandler(GeoLayerViewID="StreamReachesLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../Physical-StreamReaches/layers/stream-reaches-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="StreamReachesLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../Physical-StreamReaches/layers/stream-reaches-event-config.json")
# = = = = = = = = = =
# Canals:  read layer and add to a layer view group.
# GeoLayerViewGroupID: CanalsGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="CanalsGroup",Name="Canals (ditches)",Description="Canals (ditches)",Properties="selectedInitial: true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dwr/irrigated-lands/co-dwr-canals-district4.geojson",GeoLayerID="CanalsLayer",Name="Canals (ditches)",Description="Canals (ditches)")
AddGeoLayerViewToGeoMap(GeoLayerID="CanalsLayer",GeoLayerViewID="CanalsLayerView",Name="Canals (ditches)",Description="Canals (ditches)",Properties="docPath:layers/canals.md,highlightEnabled:true")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="CanalsLayerView",Name="Canals (ditches)",Description="Canals (ditches)",Properties="color:#d9d9d9,width:1")
# SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="CanalsLayerView",Name="Canals (ditches)",Description="Show canals in dark grey",ClassificationAttribute="county",Properties="classificationType:'SingleSymbol'")
SetGeoLayerViewEventHandler(GeoLayerViewID="CanalsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/canals-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="CanalsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/canals-event-config.json")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="DitchesProject",Indent="2",OutputFile="ditches-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="ditches-map.json",DestinationFile="${MapFolder}/ditches-map.json")
CopyFile(SourceFile="ditches-map.md",DestinationFile="${MapFolder}/ditches-map.md")
#
#CopyFile(SourceFile="layers/co-dwr-water-district-4-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-district-4-classify-district.csv")
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4-event-config.json",DestinationFile="${MapFolder}/layers/co-dwr-water-district-4-event-config.json")
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4.md",DestinationFile="${MapFolder}/layers/co-dwr-water-district-4.md")
#
CopyFile(SourceFile="layers/soil-conservation-districts-event-config.json",DestinationFile="${MapFolder}/layers/soil-conservation-districts-event-config.json")
CopyFile(SourceFile="layers/soil-conservation-districts.md",DestinationFile="${MapFolder}/layers/soil-conservation-districts.md")
#
CopyFile(SourceFile="layers/group-ditch-service-areas.md",DestinationFile="${MapFolder}/layers/group-ditch-service-areas.md")
#
# CopyFile(SourceFile="layers/ditch-service-areas-classify-croptype.csv",DestinationFile="${MapFolder}/layers/ditch-service-areas-classify-croptype.csv")
CopyFile(SourceFile="layers/ditch-service-areas-1956-event-config.json",DestinationFile="${MapFolder}/layers/ditch-service-areas-1956-event-config.json")
CopyFile(SourceFile="layers/ditch-service-areas-1976-event-config.json",DestinationFile="${MapFolder}/layers/ditch-service-areas-1976-event-config.json")
CopyFile(SourceFile="layers/ditch-service-areas-1987-event-config.json",DestinationFile="${MapFolder}/layers/ditch-service-areas-1987-event-config.json")
CopyFile(SourceFile="layers/ditch-service-areas-2001-event-config.json",DestinationFile="${MapFolder}/layers/ditch-service-areas-2001-event-config.json")
CopyFile(SourceFile="layers/ditch-service-areas-2005-event-config.json",DestinationFile="${MapFolder}/layers/ditch-service-areas-2005-event-config.json")
#
#
CopyFile(SourceFile="layers/canals.md",DestinationFile="${MapFolder}/layers/canals.md")
CopyFile(SourceFile="layers/canals-event-config.json",DestinationFile="${MapFolder}/layers/canals-event-config.json")
#
CopyFile(SourceFile="layers/ditch-service-areas.md",DestinationFile="${MapFolder}/layers/ditch-service-areas.md")
