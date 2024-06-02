# Create a GeoMapProject file for basins for the Big Thompson Basin:
# - read the previously downloaded layer file
# - output to the web folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing:
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/BasinEntities/Physical-Basins")
#
# Create a single map project and map for that project:
# - GeoMapProjectID:  BasinsProject
# - GeoMapID:  BasinsMap
CreateGeoMapProject(NewGeoMapProjectID="BasinsProject",ProjectType="SingleMap",Name="Big Thompson Basins",Description="Big Thompson Basins",Properties="author:'Open Water Foundation',specificationFlavor:'',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="BasinsMap",Name="Big Thompson Basins",Description="Big Thompson Basins",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.4,40.43,10',docPath:basins-map.md")
AddGeoMapToGeoMapProject(GeoMapProjectID="BasinsProject",GeoMapID="BasinsMap")
# = = = = = = = = = =
# Background layers:  read layers and add a layer view group.
# GeoLayerViewGroupID: BackgroundGroup
# - add tile servers from MapBox, Esri, and Google
#
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground: true, selectedInitial: true")
#
# Mapbox background layers.
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxSatelliteLayer",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxSatelliteLayer",GeoLayerViewID="MapBoxSatelliteLayerView",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="selectedInital: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreetsLayer",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreetsLayer",GeoLayerViewID="MapBoxStreetsLayerView",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/v4/mapbox.streets-satellite/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreets&SatelliteLayer",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreets&SatelliteLayer",GeoLayerViewID="MapBoxStreets&SatelliteLayerView",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/masforce/cjs108qje09ld1fo68vh7t1he/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFzZm9yY2UiLCJhIjoiY2pzMTA0bmR5MXAwdDN5bnIwOHN4djBncCJ9.ZH4CfPR8Q41H7zSpff803g",GeoLayerID="MapBoxTopographicLayer",Name="Topographic (MapBox)",Description="Topographic background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxTopographicLayer",GeoLayerViewID="MapBoxTopographicLayerView",Name="Topographic (MapBox)",Description="Topographic Map",Properties="selectedInitial: false")
#
# Esri background layers.
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
# Google background layers.
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s&x={x}&y={y}&z={z}",GeoLayerID="GoogleSatellite",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleSatellite",GeoLayerViewID="GoogleSatelliteView",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="selectedInitial: false,separatorBefore:true")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",GeoLayerID="GoogleStreets",Name="Streets (Google)",Description="Streets background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleStreets",GeoLayerViewID="GoogleStreetsView",Name="Streets (Google)",Description="Streets background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}",GeoLayerID="GoogleHybrid",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleHybrid",GeoLayerViewID="GoogleHybridView",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=p&x={x}&y={y}&z={z}",GeoLayerID="GoogleTerrain",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleTerrain",GeoLayerViewID="GoogleTerrainView",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="selectedInitial: false")
# Other.
ReadRasterGeoLayerFromTileMapService(InputUrl="https://basemap.nationalmap.gov/ArcGIS/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}",GeoLayerID="USGSTopo",Name="USGS Topo (USGS)",Description="Topo background map from USGS.",Properties="attribution: 'USGS',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="USGSTopo",GeoLayerViewID="USGSTopoView",Name="USGS Topo (USGS)",Description="USGS Topo background map from USGS.",Properties="selectedInitial: true,separatorBefore:true")
# = = = = = = = = = =
# Colorado state boundary:  read layer and add to layer view group.
# StateBoundaryGroupID: StateBoundaryGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="StateBoundaryGroup",Name="Colorado State Boundary",Description="Colorado state boundary from CDPHE.",Properties="selectedInitial: true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://opendata.arcgis.com/datasets/4402a8e032ed49eb8b37fd729e4e8f03_9.geojson",GeoLayerID="StateBoundaryLayer",Name="Colorado State Boundary",Description="Colorado state boundary from CDPHE.")
AddGeoLayerViewToGeoMap(GeoLayerID="StateBoundaryLayer",GeoLayerViewID="StateBoundaryLayerView",Name="Colorado State Boundary",Description="Colorado state boundary from CDPHE",InsertPosition="Top",Properties="docPath:../../SupportingData/Political-ColoradoStateBoundary/layers/co-state-boundary.md")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="StateBoundaryLayerView",Name="State boundary symbol",Description="State boundary in black.",Properties="color:#000000,fillColor:#000000,fillOpacity:0.0,weight:2")
# = = = = = = = = = =
# Continental divide in Colorado:  read layer and add to layer view group.
# LayerViewGroupID: ContinentalDivideGroup
#
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="ContinentalDivideGroup",Name="Continental Divide",Description="Continental Divide based on Hydrologic Unit Code basins.",Properties="selectedInitial: true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/country/us/usgs/continental-divide/continental-divide-co.geojson",GeoLayerID="ContinentalDivideLayer",Name="Continental Divide",Description="Continental divide based on Hydrologic Unit Code basins")
AddGeoLayerViewToGeoMap(GeoLayerID="ContinentalDivideLayer",GeoLayerViewID="ContinentalDivideLayerView",Name="Continental Divide",Description="Continental divide based on Hydrologic Unit Code basins",InsertPosition="Top",Properties="docPath:../../SupportingData/Physical-ContinentalDivide/layers/continental-divide.md")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="ContinentalDivideLayerView",Name="Continental divide symbol",Description="Continental divide line in wide dark grey.",Properties="color:#663300,opacity:0.5,fillColor:#663300,fillOpacity:0.5,weight:10")
SetGeoLayerViewEventHandler(GeoLayerViewID="ContinentalDivideLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../../SupportingData/Physical-ContinentalDivide/layers/continental-divide-co-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="ContinentalDivideLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../../SupportingData/Physical-ContinentalDivide/layers/continental-divide-co-event-config.json")
# = = = = = = = = = =
# Water district 4:  read layer and add to layer view group:
# - put behind because otherwise obscures the basins
# - TODO smalers 2020-08-23 need a polyline version so can draw on top
# GeoLayerViewGroupID: WaterDistrictsGroup
AddGeoLayerViewGroupToGeoMap(GeoMapID="BasinsMap",GeoLayerViewGroupID="WaterDistrictsGroup",Name="CO DWR Water Districts",Description="Water District boundaries from the Colorado Division of Water Resources.",Properties="selectedInitial: true",InsertPosition="Top")
#
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4.md",DestinationFile="layers/co-dwr-water-district-4.md")
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4-classify-district.csv",DestinationFile="layers/co-dwr-water-district-4-classify-district.csv")
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dwr/districts/co-dwr-district-4.geojson",GeoLayerID="WaterDistrictLayer",Name="CO DWR Water District 4",Description="Water District 4 boundary from the Colorado Division of Water Resources.")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDistrictLayer",GeoLayerViewID="WaterDistrictLayerView",Name="CO DWR Water District 4",Description="Water District 4 boundary from the Colorado Division of Water Resources",InsertPosition="Top",Properties="docPath:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4.md")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="WaterDistrictLayerView",Name="Colorize district",Description="Show Water District 4 in black.",ClassificationAttribute="DISTRICT",Properties="classificationFile:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4-classify-district.csv")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterDistrictLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterDistrictLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4-event-config.json")
# = = = = = = = = = =
# HUC2:  read layer and add to layer view group.
# GeoLayerViewGroupID: HUCsGroup
#
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="HUCBasinsGroup",Name="Hydrologic Unit Code (HUC) Basins",Description="HUC Basin boundaries from the USGS.",Properties="selectedInitial: true",InsertPosition="Top")
# HUC 2 on bottom
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/country/us/usgs/huc-basins/huc2-basin-10-missouri.geojson",GeoLayerID="HUC2BasinLayer",Name="HUC2 Basin: 10, Missouri",Description="HUC2 Basin boundaries from the USGS")
AddGeoLayerViewToGeoMap(GeoLayerID="HUC2BasinLayer",GeoLayerViewID="HUC2BasinsLayerView",Name="HUC2 Basin: 10, Missouri",Description="HUC2 Basin boundaries from the USGS",InsertPosition="Top",Properties="docPath:layers/huc2.md")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="HUC2BasinsLayerView",Name="Colorize HUC2",Description="Transparent polygon.",ClassificationAttribute="huc2",Properties="classificationFile:layers/huc2-classify-huc2.csv")
SetGeoLayerViewEventHandler(GeoLayerViewID="HUC2BasinsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/huc2-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="HUC2BasinsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/huc2-event-config.json")
# HUC 4 next on top
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/country/us/usgs/huc-basins/huc4-basin-1019-south-platte.geojson",GeoLayerID="HUC4BasinLayer",Name="HUC4 Basin: 1019, Platte",Description="HUC4 Basin boundaries from the USGS")
AddGeoLayerViewToGeoMap(GeoLayerID="HUC4BasinLayer",GeoLayerViewID="HUC4BasinsLayerView",Name="HUC4 Basin: 1019, Platte",Description="HUC4 Basin boundaries from the USGS",InsertPosition="Top",Properties="docPath:layers/huc4.md")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="HUC4BasinsLayerView",Name="Colorize HUC4",Description="Transparent polygon.",ClassificationAttribute="huc4",Properties="classificationFile:layers/huc4-classify-huc4.csv")
SetGeoLayerViewEventHandler(GeoLayerViewID="HUC4BasinsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/huc4-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="HUC4BasinsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/huc4-event-config.json")
# HUC 8 next on top
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/country/us/usgs/huc-basins/huc8-basin-10190006-big-thompson.geojson",GeoLayerID="HUC8BasinLayer",Name="HUC8 Basin: 10190006, Big Thompson",Description="HUC8 Basin boundaries from the USGS")
AddGeoLayerViewToGeoMap(GeoLayerID="HUC8BasinLayer",GeoLayerViewID="HUC8BasinsLayerView",Name="HUC8 Basin: 10100006, Big Thompson",Description="HUC8 Basin boundaries from the USGS",InsertPosition="Top",Properties="docPath:layers/huc8.md")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="HUC8BasinsLayerView",Name="Colorize HUC8",Description="Transparent polygon.",ClassificationAttribute="huc8",Properties="classificationFile:layers/huc8-classify-huc8.csv")
SetGeoLayerViewEventHandler(GeoLayerViewID="HUC8BasinsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/huc8-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="HUC8BasinsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/huc8-event-config.json")
# HUC 10 next on top
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/country/us/usgs/huc-basins/huc10-basins-10190006-big-thompson.geojson",GeoLayerID="HUC10BasinLayer",Name="Big Thompson HUC10 Basins",Description="HUC10 Basin boundaries from the USGS")
AddGeoLayerViewToGeoMap(GeoLayerID="HUC10BasinLayer",GeoLayerViewID="HUC10BasinsLayerView",Name="Big Thompson HUC10 Basins",Description="HUC10 Basin boundaries from the USGS",InsertPosition="Top",Properties="docPath:layers/huc10.md,highlightEnabled:true")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="HUC10BasinsLayerView",Name="Colorize HUC10",Description="Transparent polygon.",ClassificationAttribute="huc10",Properties="classificationFile:layers/huc10-classify-huc10.csv")
SetGeoLayerViewEventHandler(GeoLayerViewID="HUC10BasinsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/huc10-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="HUC10BasinsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/huc10-event-config.json")
# HUC 12 next on top
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/country/us/usgs/huc-basins/huc12-basins-10190006-big-thompson.geojson",GeoLayerID="HUC12BasinLayer",Name="Big Thompson HUC12 Basins",Description="HUC12 Basin boundaries from the USGS")
AddGeoLayerViewToGeoMap(GeoLayerID="HUC12BasinLayer",GeoLayerViewID="HUC12BasinsLayerView",Name="Big Thompson HUC 12 Basins",Description="HUC12 Basin boundaries from the USGS",InsertPosition="Top",Properties="docPath:layers/huc12.md,highlightEnabled:true")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="HUC12BasinsLayerView",Name="Colorize HUC12",Description="Transparent polygon.",ClassificationAttribute="huc12",Properties="classificationFile:layers/huc12-classify-huc12.csv")
SetGeoLayerViewEventHandler(GeoLayerViewID="HUC12BasinsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/huc12-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="HUC12BasinsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/huc12-event-config.json")
# = = = = = = = = = =
# Stream reaches:  read layer and add to a layer view group.
# - TODO smalers 2020-05-22 for now copy the stream reaches but want to use shared layer
# GeoLayerViewGroupID: StreamReachesGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="StreamReachesGroup",Name="Stream Reaches",Description="Stream Reaches",Properties="selectedInitial: true",InsertPosition="Top")
#
CopyFile(SourceFile="../Physical-StreamReaches/layers/stream-reaches.md",DestinationFile="layers/stream-reaches.md")
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dwr/stream-reaches/co-stream-reaches-district4.geojson",GeoLayerID="StreamReachesLayer",Name="Stream Reaches",Description="Stream Reaches")
AddGeoLayerViewToGeoMap(GeoLayerID="StreamReachesLayer",GeoLayerViewID="StreamReachesLayerView",Name="Stream Reaches",Description="Stream Reaches",Properties="docPath:../Physical-StreamReaches/layers/stream-reaches.md,highlightEnabled:true")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="StreamReachesLayerView",Name="Stream Reaches",Description="Stream Reaches",Properties="color:#6297f7,width:2")
SetGeoLayerViewEventHandler(GeoLayerViewID="StreamReachesLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../Physical-StreamReaches/layers/stream-reaches-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="StreamReachesLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../Physical-StreamReaches/layers/stream-reaches-event-config.json")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="BasinsProject",Indent="2",OutputFile="basins-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="basins-map.json",DestinationFile="${MapFolder}/basins-map.json")
CopyFile(SourceFile="basins-map.md",DestinationFile="${MapFolder}/basins-map.md")
#
CopyFile(SourceFile="layers/huc2-classify-huc2.csv",DestinationFile="${MapFolder}/layers/huc2-classify-huc2.csv")
CopyFile(SourceFile="layers/huc2.md",DestinationFile="${MapFolder}/layers/huc2.md")
CopyFile(SourceFile="layers/huc2-event-config.json",DestinationFile="${MapFolder}/layers/huc2-event-config.json")
#
CopyFile(SourceFile="layers/huc4-classify-huc4.csv",DestinationFile="${MapFolder}/layers/huc4-classify-huc4.csv")
CopyFile(SourceFile="layers/huc4.md",DestinationFile="${MapFolder}/layers/huc4.md")
CopyFile(SourceFile="layers/huc4-event-config.json",DestinationFile="${MapFolder}/layers/huc4-event-config.json")
#
CopyFile(SourceFile="layers/huc8-classify-huc8.csv",DestinationFile="${MapFolder}/layers/huc8-classify-huc8.csv")
CopyFile(SourceFile="layers/huc8.md",DestinationFile="${MapFolder}/layers/huc8.md")
CopyFile(SourceFile="layers/huc8-event-config.json",DestinationFile="${MapFolder}/layers/huc8-event-config.json")
#
CopyFile(SourceFile="layers/huc10-classify-huc10.csv",DestinationFile="${MapFolder}/layers/huc10-classify-huc10.csv")
CopyFile(SourceFile="layers/huc10.md",DestinationFile="${MapFolder}/layers/huc10.md")
CopyFile(SourceFile="layers/huc10-event-config.json",DestinationFile="${MapFolder}/layers/huc10-event-config.json")
#
CopyFile(SourceFile="layers/huc12-classify-huc12.csv",DestinationFile="${MapFolder}/layers/huc12-classify-huc12.csv")
CopyFile(SourceFile="layers/huc12.md",DestinationFile="${MapFolder}/layers/huc12.md")
CopyFile(SourceFile="layers/huc12-event-config.json",DestinationFile="${MapFolder}/layers/huc12-event-config.json")
#
#CopyFile(SourceFile="layers/co-dwr-water-district-4-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-district-4-classify-district.csv")
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4-event-config.json",DestinationFile="${MapFolder}/layers/co-dwr-water-district-4-event-config.json")
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4.md",DestinationFile="${MapFolder}/layers/co-dwr-water-district-4.md")
#
#CopyFile(SourceFile="../Physical-StreamReaches/layers/stream-reaches-event-config.json",DestinationFile="${MapFolder}/layers/stream-reaches-event-config.json")
#CopyFile(SourceFile="../Physical-StreamReaches/layers/stream-reaches.md",DestinationFile="${MapFolder}/layers/stream-reaches.md")
#
#CopyFile(SourceFile="../../SupportingData/Political-ColoradoStateBoundary/layers/co-state-boundary.md",DestinationFile="${MapFolder}/layers/co-state-boundary.md")
#
#CopyFile(SourceFile="../../SupportingData/Physical-ContinentalDivide/layers/continental-divide-co-event-config.json",DestinationFile="${MapFolder}/layers/continental-divide-co-event-config.json")
#CopyFile(SourceFile="../../SupportingData/Physical-ContinentalDivide/layers/continental-divide.md",DestinationFile="${MapFolder}/layers/continental-divide.md")
