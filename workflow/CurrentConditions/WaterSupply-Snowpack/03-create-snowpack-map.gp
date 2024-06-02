# Create a GeoMapProject file for current conditions snowpack:
# - read the previously downloaded layer file
# - output to the web folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/CurrentConditions/WaterSupply-Snowpack")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  SnowpackProject
# - GeoMapID:  CurrentSnowpackMap
CreateGeoMapProject(NewGeoMapProjectID="SnowpackProject",ProjectType="SingleMap",Name="Current Snowpack",Description="Current snowpack",Properties="author:'Open Water Foundation',specificationFlavor:'',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="CurrentSnowpackMap",Name="Current Snowpack",Description="Current snowpack",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.4,40.43,10',docPath:snowpack-map.md")
AddGeoMapToGeoMapProject(GeoMapProjectID="SnowpackProject",GeoMapID="CurrentSnowpackMap")
# = = = = = = = = = =
# Background layers:  read layers and add a layer view group
# GeoLayerViewGroupID: BackgroundGroup
# - add tile servers from MapBox, Esri, and Google
#
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground:true,selectedInitial:true")
#
# Mapbox background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxSatelliteLayer",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxSatelliteLayer",GeoLayerViewID="MapBoxSatelliteLayerView",Name="Satellite (MapBox)",Description="Satellite background map from MapBox.",Properties="selectedInital: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/mapbox/streets-v10/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreetsLayer",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreetsLayer",GeoLayerViewID="MapBoxStreetsLayerView",Name="Streets (MapBox)",Description="Streets background map from MapBox.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/v4/mapbox.streets-satellite/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoia3Jpc3RpbnN3YWltIiwiYSI6ImNpc3Rjcnl3bDAzYWMycHBlM2phbDJuMHoifQ.vrDCYwkTZsrA_0FffnzvBw",GeoLayerID="MapBoxStreets&SatelliteLayer",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxStreets&SatelliteLayer",GeoLayerViewID="MapBoxStreets&SatelliteLayerView",Name="Streets & Satellite (MapBox)",Description="Streets and satellite background map from MapBox.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://api.mapbox.com/styles/v1/masforce/cjs108qje09ld1fo68vh7t1he/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFzZm9yY2UiLCJhIjoiY2pzMTA0bmR5MXAwdDN5bnIwOHN4djBncCJ9.ZH4CfPR8Q41H7zSpff803g",GeoLayerID="MapBoxTopographicLayer",Name="Topographic (MapBox)",Description="Topographic background map from MapBox.",Properties="attribution: 'MapBox',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="MapBoxTopographicLayer",GeoLayerViewID="MapBoxTopographicLayerView",Name="Topographic (MapBox)",Description="Topographic Map",Properties="selectedInitial:false")
#
# Esri background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Dark_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriDarkGray",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriDarkGray",GeoLayerViewID="EsriDarkGrayView",Name="Dark Gray (Esri)",Description="Dark Gray background map from Esri.",Properties="selectedInitial:false,separatorBefore:true")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriImagery",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriImagery",GeoLayerViewID="EsriImageryView",Name="Imagery (Esri)",Description="Imagery background map from Esri.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriLightGray",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriLightGray",GeoLayerViewID="EsriLightGrayView",Name="Light Gray (Esri)",Description="Light Gray background map from Esri.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriNationalGeographic",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriNationalGeographic",GeoLayerViewID="EsriNationalGeographicView",Name="National Geographic (Esri)",Description="National Geographic background map from Esri.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriShadedRelief",Name="Shaded Relief (Esri)",Description="Shaded Relief background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriShadedRelief",GeoLayerViewID="EsriShadedReliefView",Name="Shaded Relief (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriStreets",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriStreets",GeoLayerViewID="EsriStreetsView",Name="Streets (Esri)",Description="Streets background map from Esri.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTerrain",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTerrain",GeoLayerViewID="EsriTerrainView",Name="Terrain (Esri)",Description="Terrain background map from Esri.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}",GeoLayerID="EsriTopographic",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="attribution: 'Esri',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="EsriTopographic",GeoLayerViewID="EsriTopographicView",Name="Topographic (Esri)",Description="Topographic background map from Esri.",Properties="selectedInitial:false")
#
# Google background layers
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s&x={x}&y={y}&z={z}",GeoLayerID="GoogleSatellite",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleSatellite",GeoLayerViewID="GoogleSatelliteView",Name="Satellite (Google)",Description="Satellite background map from Google.",Properties="selectedInitial:false,separatorBefore:true")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",GeoLayerID="GoogleStreets",Name="Streets (Google)",Description="Streets background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleStreets",GeoLayerViewID="GoogleStreetsView",Name="Streets (Google)",Description="Streets background map from Google.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}",GeoLayerID="GoogleHybrid",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleHybrid",GeoLayerViewID="GoogleHybridView",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="selectedInitial:false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=p&x={x}&y={y}&z={z}",GeoLayerID="GoogleTerrain",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleTerrain",GeoLayerViewID="GoogleTerrainView",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="selectedInitial:false")
# Other
ReadRasterGeoLayerFromTileMapService(InputUrl="https://basemap.nationalmap.gov/ArcGIS/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}",GeoLayerID="USGSTopo",Name="USGS Topo (USGS)",Description="Topo background map from USGS.",Properties="attribution: 'USGS',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="USGSTopo",GeoLayerViewID="USGSTopoView",Name="USGS Topo (USGS)",Description="USGS Topo background map from USGS.",Properties="selectedInitial:true,separatorBefore:true")
# = = = = = = = = = =
# Colorado state boundary:  read layer and add to layer view group.
# StateBoundaryGroupID: StateBoundaryGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="StateBoundaryGroup",Name="Colorado State Boundary",Description="Colorado state boundary from CDPHE.",Properties="selectedInitial: true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://opendata.arcgis.com/datasets/4402a8e032ed49eb8b37fd729e4e8f03_9.geojson",GeoLayerID="StateBoundaryLayer",Name="Colorado State Boundary",Description="Colorado state boundary from CDPHE.")
AddGeoLayerViewToGeoMap(GeoLayerID="StateBoundaryLayer",GeoLayerViewID="StateBoundaryLayerView",Name="Colorado State Boundary",Description="Colorado state boundary from CDPHE",InsertPosition="Top",Properties="docPath:../../SupportingData/Political-ColoradoStateBoundary/layers/co-state-boundary.md")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="StateBoundaryLayerView",Name="State boundary symbol",Description="State boundary in black.",Properties="color:#000000,fillColor:#000000,fillOpacity:0.0,weight:2")
# = = = = = = = = = =
# Water district 4:  read layer and add to layer view group.
# GeoLayerViewGroupID: WaterDistrictsGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="WaterDistrictsGroup",Name="CO DWR Water Districts",Description="Water District boundaries from the Colorado Division of Water Resources.",Properties="selectedInitial:true",InsertPosition="Top")
#
#CopyFile(SourceFile="../../BasinEntities/Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4.md",DestinationFile="layers/co-dwr-water-district-4.md")
#CopyFile(SourceFile="../../BasinEntities/Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4-event-config.json",DestinationFile="layers/co-dwr-water-district-4-event-config.json")
#CopyFile(SourceFile="../../BasinEntities/Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4-classify-district.csv",DestinationFile="layers/co-dwr-water-district-4-classify-district.csv")
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dwr/districts/co-dwr-district-4.geojson",GeoLayerID="WaterDistrictLayer",Name="CO DWR Water District 4",Description="Water District 4 boundary from the Colorado Division of Water Resources.")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDistrictLayer",GeoLayerViewID="WaterDistrictLayerView",Name="CO DWR Water District 4",Description="Water District 4 boundary from the Colorado Division of Water Resources",Properties="docPath:../../BasinEntities/Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4.md",InsertPosition="Top")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="WaterDistrictLayerView",Name="Colorize district",Description="Show Water District 4 in black.",ClassificationAttribute="DISTRICT",Properties="classificationFile:../../BasinEntities/Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4-classify-district.csv")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterDistrictLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../../BasinEntities/Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterDistrictLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../../BasinEntities/Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4-event-config.json")
# = = = = = = = = = =
# Continental divide in Colorado:  read layer and add to layer view group.
# LayerViewGroupID: ContinentalDivideGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="ContinentalDivideGroup",Name="Continental Divide",Description="Continental Divide based on Hydrologic Unit Code basins.",Properties="selectedInitial:true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/country/us/usgs/continental-divide/continental-divide-co.geojson",GeoLayerID="ContinentalDivideLayer",Name="Continental Divide",Description="Continental divide based on Hydrologic Unit Code basins")
AddGeoLayerViewToGeoMap(GeoLayerID="ContinentalDivideLayer",GeoLayerViewID="ContinentalDivideLayerView",Name="Continental Divide",Description="Continental divide based on Hydrologic Unit Code basins",InsertPosition="Top",Properties="docPath:../../SupportingData/Physical-ContinentalDivide/layers/continental-divide.md")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="ContinentalDivideLayerView",Name="Continental divide symbol",Description="Continental divide line in wide dark grey.",Properties="color:#663300,opacity:0.5,fillColor:#663300,fillOpacity:0.5,weight:10")
SetGeoLayerViewEventHandler(GeoLayerViewID="ContinentalDivideLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../../SupportingData/Physical-ContinentalDivide/layers/continental-divide-co-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="ContinentalDivideLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../../SupportingData/Physical-ContinentalDivide/layers/continental-divide-co-event-config.json")
# = = = = = = = = = =
# SNODAS snow:  read layer and add to a layer view group.
# GeoLayerViewGroupID: SnowpackBasinsGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="SnowpackBasinsGroup",Name="Snowpack Basins",Description="Snowpack for basins",InsertPosition="Top")
#
# Use the current GeoJSON file from the SNODAS tools website
# - TODO smalers 2021-04-20 this is old GeoJSON which causes problems for InfoMapper
ReadGeoLayerFromGeoJSON(InputFile="https://snodas.cdss.state.co.us/app/SnowpackStatisticsByDate/SnowpackStatisticsByDate_LatestDate.geojson",GeoLayerID="SnodasLayer",Name="Snowpack (SNODAS)",Description="Snowpack from SNODAS")
# TODO smalers 2022-07-05 remove the following when the above tests out in 2022/2023
# The following was used when SNODAS layer was processed in this folder (now can use web GeoJSON file).
#ReadGeoLayerFromGeoJSON(InputFile="layers/snodas.geojson",GeoLayerID="SnodasLayer",Name="Snowpack (SNODAS)",Description="Snowpack from SNODAS")
# The following was implemented because the SNODAS website was not using GeoJSON 2 format (latest SNODAS tools uses the correct format):
# - uses the build-util/harvest-data.bash script
#ReadGeoLayerFromGeoJSON(InputFile="http://data.openwaterfoundation.org/CO/CDSS/SNODAS/SnowpackStatisticsByDate_LatestDate.geojson",GeoLayerID="SnodasLayer",Name="Snowpack (SNODAS)",Description="Snowpack from SNODAS")
AddGeoLayerViewToGeoMap(GeoLayerID="SnodasLayer",GeoLayerViewID="SnodasLayerView",Name="Snowpack (SNODAS)",Description="Snowpack from SNODAS as basin mean SWE (in)",Properties="docPath:layers/snodas.md,refreshInterval:6Hour")
# Use graduated symbol the same as the SNODAS website
SetGeoLayerViewEventHandler(GeoLayerViewID="SnodasLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/snodas-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="SnodasLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/snodas-event-config.json")
# The following is for the downloaded GeoJSON
#SetGeoLayerViewGraduatedSymbol(GeoLayerViewID="SnodasLayerView",Name="Colorize SWE",Description="Show SWE using SNODAS tools colors.",ClassificationAttribute="SNODAS_SWE_Mean_in",Properties="classificationFile:layers/snodas-classify-swe-in.csv")
# The following is for the downloaded shapefile saved as GeoJSON
SetGeoLayerViewGraduatedSymbol(GeoLayerViewID="SnodasLayerView",Name="Colorize SWE",Description="Show SWE using SNODAS tools colors.",ClassificationAttribute="SWEMean_in",Properties="classificationFile:layers/snodas-classify-swe-in.csv")
# = = = = = = = = = =
# Stream reaches:  read layer and add to a layer view group.
# - TODO smalers 2020-05-22 for now copy the stream reaches but want to use shared layer
# GeoLayerViewGroupID: StreamReachesGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="StreamReachesGroup",Name="Stream Reaches",Description="Stream reaches",Properties="selectedInitial:true",InsertPosition="Top")
#
#CopyFile(SourceFile="../../BasinEntities/Physical-StreamReaches/layers/stream-reaches.md",DestinationFile="layers/stream-reaches.md")
#CopyFile(SourceFile="../../BasinEntities/Physical-StreamReaches/layers/stream-reaches-event-config.json",DestinationFile="layers/stream-reaches-event-config.json")
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dwr/stream-reaches/co-stream-reaches-district4.geojson",GeoLayerID="StreamReachesLayer",Name="Stream Reaches",Description="Stream reaches")
AddGeoLayerViewToGeoMap(GeoLayerID="StreamReachesLayer",GeoLayerViewID="StreamReachesLayerView",Name="Stream Reaches",Description="Stream reaches",Properties="docPath:../../BasinEntities/Physical-StreamReaches/layers/stream-reaches.md,highlightEnabled:true")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="StreamReachesLayerView",Name="Stream Reaches",Description="Stream reaches",Properties="color:#6297f7,width:2")
#SetGeoLayerViewSingleSymbol(GeoLayerViewID="StreamReachesLayerView",Name="Stream Reaches",Description="Stream reaches")
#SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="StreamReachesLayerView",Name="Stream Reaches",Description="Show stream reaches is blue lines",ClassificationAttribute="county",Properties="classificationType:'SingleSymbol'")
SetGeoLayerViewEventHandler(GeoLayerViewID="StreamReachesLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../../BasinEntities/Physical-StreamReaches/layers/stream-reaches-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="StreamReachesLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../../BasinEntities/Physical-StreamReaches/layers/stream-reaches-event-config.json")
# = = = = = = = = = =
# Snow stations:  read layer and add to a layer view group.
# GeoLayerViewGroupID: SnowStationsGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="SnowStationsGroup",Name="Snow Stations",Description="Snow stations",Properties="selectedInitial: true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/country/us/nrcs/snotel/co-snotel-stations.geojson",GeoLayerID="SnotelStationsLayer",Name="SNOTEL Stations",Description="SNOTEL stations from NRCS")
AddGeoLayerViewToGeoMap(GeoLayerID="SnotelStationsLayer",GeoLayerViewID="SnotelStationsLayerView",Name="SNOTEL Stations",Description="SNOTEL stations from NRCS",Properties="docPath:'layers/snotel-stations.md'")
# For now use single symbol
# - TODO smalers 2020-05-22 need to enable a graduated symbol based on SWE value
SetGeoLayerViewSingleSymbol(GeoLayerViewID="SnotelStationsLayerView",Name="SNOTEL Stations",Description="SNOTEL stations from NRCS",Properties="symbolShape:Circle,color:black,fillColor:black,symbolSize:4,sizeUnits:pixels,opacity:1.0,fillOpacity:1.0,weight:1.5")
SetGeoLayerViewEventHandler(GeoLayerViewID="SnotelStationsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/snotel-stations-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="SnotelStationsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/snotel-stations-event-config.json")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="SnowpackProject",Indent="2",OutputFile="snowpack-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="snowpack-map.json",DestinationFile="${MapFolder}/snowpack-map.json")
CopyFile(SourceFile="snowpack-map.md",DestinationFile="${MapFolder}/snowpack-map.md")
# -----
# Layer
# SNOTEL stations.
CopyFile(SourceFile="layers/snotel-stations.md",DestinationFile="${MapFolder}/layers/snotel-stations.md")
CopyFile(SourceFile="layers/snotel-stations-event-config.json",DestinationFile="${MapFolder}/layers/snotel-stations-event-config.json")
# Stream reaches.
#CopyFile(SourceFile="layers/stream-reaches-event-config.json",DestinationFile="${MapFolder}/layers/stream-reaches-event-config.json")
#CopyFile(SourceFile="../../BasinEntities/Physical-StreamReaches/layers/stream-reaches.md",DestinationFile="${MapFolder}/layers/stream-reaches.md")
# SNODAS snowpack.
# - no need to copy layer because read from URL
CopyFile(SourceFile="layers/snodas.md",DestinationFile="${MapFolder}/layers/snodas.md")
CopyFile(SourceFile="layers/snodas-event-config.json",DestinationFile="${MapFolder}/layers/snodas-event-config.json")
CopyFile(SourceFile="layers/snodas-classify-swe-in.csv",DestinationFile="${MapFolder}/layers/snodas-classify-swe-in.csv")
# Continental divide.
# - no need to copy layer because read from URL
#CopyFile(SourceFile="layers/continental-divide-co-event-config.json",DestinationFile="${MapFolder}/layers/continental-divide-co-event-config.json")
#CopyFile(SourceFile="../../SupportingData/Physical-ContinentalDivide/layers/continental-divide.md",DestinationFile="${MapFolder}/layers/continental-divide.md")
# Water district 4.
#CopyFile(SourceFile="layers/co-dwr-water-district-4-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-district-4-classify-district.csv")
#CopyFile(SourceFile="layers/co-dwr-water-district-4-event-config.json",DestinationFile="${MapFolder}/layers/co-dwr-water-district-4-event-config.json")
#CopyFile(SourceFile="../../BasinEntities/Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4.md",DestinationFile="${MapFolder}/layers/co-dwr-water-district-4.md")
