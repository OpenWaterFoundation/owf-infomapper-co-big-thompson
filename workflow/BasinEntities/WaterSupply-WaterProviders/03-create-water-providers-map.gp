# Create a GeoMapProject file for water providers:
# - read the previously downloaded layer file
# - output to the web folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/BasinEntities/WaterSupply-WaterProviders")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  WaterProvidersProject
# - GeoMapID:  WaterProvidersMap
CreateGeoMapProject(NewGeoMapProjectID="WaterProvidersProject",ProjectType="SingleMap",Name="Water Providers",Description="Water providers",Properties="author:'Open Water Foundation',specificationFlavor:'',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="WaterProvidersMap",Name="Water Providers",Description="Water Providers",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.4,40.43,10',docPath:'water-providers-map.md'")
AddGeoMapToGeoMapProject(GeoMapProjectID="WaterProvidersProject",GeoMapID="WaterProvidersMap")
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
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleHybrid",GeoLayerViewID="GoogleHybridView",Name="Streets & Satellite (Google)",Description="Streets & satellite background map from Google.",Properties="selectedInitial: false")
ReadRasterGeoLayerFromTileMapService(InputUrl="http://mt0.google.com/vt/lyrs=p&x={x}&y={y}&z={z}",GeoLayerID="GoogleTerrain",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="attribution: 'Google',isBackground: true")
AddGeoLayerViewToGeoMap(GeoLayerID="GoogleTerrain",GeoLayerViewID="GoogleTerrainView",Name="Terrain (Google)",Description="Terrain background map from Google.",Properties="selectedInitial: false")
# Other
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
# Fire Protection Districts
# = = = = = = = = = =
# - color is reddish
# GeoLayerViewGroupID: FireProtectionDistrictsGoup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="FireProtectionDistrictsGoup",Name="Fire Protection Districts",Description="Fire protection districts from DOLA.",Properties="selectedInitial: true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dola/district-boundaries/latest/co-fire-protection-districts-waterdistrict4.geojson",GeoLayerID="FireProtectionDistrictsLayer",Name="Fire Protection Districts",Description="Fire protection districts from DOLA.")
# Do not show by default because want to focus on municipal water providers.
AddGeoLayerViewToGeoMap(GeoLayerID="FireProtectionDistrictsLayer",GeoLayerViewID="FireProtectionDistrictsLayerView",Name="Fire Protection Districts",Description="Fire protection districts from DOLA",InsertPosition="Top",Properties="docPath:layers/fire-protection-districts.md,selectedInitial:false,highlightEnabled:true")
# Color is a brownish orange.
SetGeoLayerViewSingleSymbol(GeoLayerViewID="FireProtectionDistrictsLayerView",Name="Fire Protection Districts",Description="Fire protection districts from DOLA",Properties="color:#cc3300,opacity:1.0,fillColor:#cc3300,fillOpacity:0.3,weight:2")
SetGeoLayerViewEventHandler(GeoLayerViewID="FireProtectionDistrictsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/fire-protection-districts-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="FireProtectionDistrictsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/fire-protection-districts-event-config.json")
# = = = = = = = = = =
# Water Conservancy Districts 
# = = = = = = = = = =
# - color is slightly purple/gray
# GeoLayerViewGroupID: WaterConservancyDistrictsGoup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="WaterConservancyDistrictsGoup",Name="Water Conservancy Districts",Description="Major water conservancy and conservation districts.",Properties="selectedInitial: true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/owf/municipal-water-provider-boundaries/latest/co-water-conservancy-district-boundaries.geojson",GeoLayerID="WaterConservancyDistrictsLayer",Name="Water Conservancy Districts",Description="Major water conservancy and conservation districts.")
# Do not show by default because want to focus on retail districts.
AddGeoLayerViewToGeoMap(GeoLayerID="WaterConservancyDistrictsLayer",GeoLayerViewID="WaterConservancyDistrictsLayerView",Name="Water Conservancy Districts",Description="Major water conservancy and conservation disricts",InsertPosition="Top",Properties="docPath:layers/water-conservancy-districts.md,selectedInitial:false,highlightEnabled:true")
# Color is a brownish orange.
SetGeoLayerViewSingleSymbol(GeoLayerViewID="WaterConservancyDistrictsLayerView",Name="Water Conservancy Districts",Description="Major water conservancy and conservation districts",Properties="color:#ff99ff,opacity:1.0,fillColor:#ff99ff,fillOpacity:0.3,weight:2")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterConservancyDistrictsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/water-conservancy-districts-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterConservancyDistrictsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/water-conservancy-districts-event-config.json")
# = = = = = = = = = =
# Municipal Water Provider boundaries (only Special Districts):  read layer and add to a layer view group.
# GeoLayerViewGroupID: WaterProviderBoundariesGroup
#
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="WaterProviderBoundariesGroup",Name="Municipal Water Provider Boundaries",Description="Municipal water provider boundaries",Properties="selectBehavior:Single",InsertPosition="Top")
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/owf/municipal-water-provider-boundaries/latest/co-municipal-water-provider-boundaries-districts-only.geojson",GeoLayerID="WaterProviderBoundariesDolaLayer",Name="Municipal Water Provider Boundaries (only special districts, no utilities or large conservancy districts)",Description="Municipal water provider boundaries (only special districts (no utilities or large conservancy districts)")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterProviderBoundariesDolaLayer",GeoLayerViewID="WaterProviderBoundariesDolaLayerView",Name="Municipal Water Provider Boundaries (only Special Districts)",Description="Municipal water provider boundaries from DOLA (no utilities or large conservancy districts, input to the merged layer)",InsertPosition="Top",Properties="docPath:'layers/water-provider-boundaries-dola.md',selectedInitial:false")
# For now use single symbol
# - grey
SetGeoLayerViewSingleSymbol(GeoLayerViewID="WaterProviderBoundariesDolaLayerView",Name="Municipal Water Provider Boundaries (only Special Districts)",Description="Municipal water provider boundaries (only special districts (no utilities or large conservancy districts)",Properties="color:#595959,opacity:1.0,fillColor:#595959,fillOpacity:0.3,weight:2")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterProviderBoundariesDolaLayerView",EventType="click",Properties="eventConfigPath:layers/water-provider-boundaries-dola-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterProviderBoundariesDolaLayerView",EventType="hover",Properties="eventConfigPath:layers/water-provider-boundaries-dola-event-config.json")
# = = = = = = = = = =
# Water Provider boundaries (merged):  read layer and add to a layer view group.
# GeoLayerViewGroupID: WaterProviderBoundariesGroup
#
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/owf/municipal-water-provider-boundaries/latest/co-municipal-water-provider-boundaries.geojson",GeoLayerID="WaterProviderBoundariesLayer",Name="Municipal Water Provider Boundaries",Description="Municipal water provider boundaries")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterProviderBoundariesLayer",GeoLayerViewID="WaterProviderBoundariesLayerView",Name="Municipal Water Provider Boundaries (Special Districts & Utilities)",Description="Municipal water provider boundaries, merged from multiple sources (no large conservancy districts)",InsertPosition="Top",Properties="docPath:'layers/water-provider-boundaries.md',selectedInitial:true,highlightEnabled:true")
# For now use single symbol, could categorize based on entity type
# - grey
SetGeoLayerViewSingleSymbol(GeoLayerViewID="WaterProviderBoundariesLayerView",Name="Municipal Water Provider Boundaries",Description="Municipal water provider boundaries",Properties="color:#595959,opacity:1.0,fillColor:#595959,fillOpacity:0.3,weight:2")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterProviderBoundariesLayerView",EventType="click",Properties="eventConfigPath:layers/water-provider-boundaries-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterProviderBoundariesLayerView",EventType="hover",Properties="eventConfigPath:layers/water-provider-boundaries-event-config.json")
# = = = = = = = = = =
# Stream reaches:  read layer and add to a layer view group.
# - TODO smalers 2020-05-22 for now copy the stream reaches but want to use shared layer
# GeoLayerViewGroupID: StreamReachesGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="StreamReachesGroup",Name="Stream Reaches",Description="Stream reaches",Properties="selectedInitial:true",InsertPosition="Top")
#
#CopyFile(SourceFile="../../BasinEntities/Physical-StreamReaches/layers/stream-reaches.md",DestinationFile="layers/stream-reaches.md")
#CopyFile(SourceFile="../../BasinEntities/Physical-StreamReaches/layers/stream-reaches-event-config.json",DestinationFile="layers/stream-reaches-event-config.json")
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dwr/stream-reaches/co-stream-reaches-district4.geojson",GeoLayerID="StreamReachesLayer",Name="Stream Reaches",Description="Stream reaches")
AddGeoLayerViewToGeoMap(GeoLayerID="StreamReachesLayer",GeoLayerViewID="StreamReachesLayerView",Name="Stream Reaches",Description="Stream reaches",Properties="docPath:../Physical-StreamReaches/layers/stream-reaches.md,highlightEnabled:true")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="StreamReachesLayerView",Name="Stream Reaches",Description="Stream reaches",Properties="color:#6297f7,width:2")
#SetGeoLayerViewSingleSymbol(GeoLayerViewID="StreamReachesLayerView",Name="Stream Reaches",Description="Stream reaches")
#SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="StreamReachesLayerView",Name="Stream Reaches",Description="Show stream reaches is blue lines",ClassificationAttribute="county",Properties="classificationType:'SingleSymbol'")
SetGeoLayerViewEventHandler(GeoLayerViewID="StreamReachesLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../Physical-StreamReaches/layers/stream-reaches-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="StreamReachesLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../Physical-StreamReaches/layers/stream-reaches-event-config.json")
# = = = = = = = = = =
# Water provider points:  read layer and add to a layer view group.
# GeoLayerViewGroupID: WaterProvidersGroup
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/owf/municipal-water-providers/co-municipal-water-providers.geojson",GeoLayerID="WaterProvidersLayer",Name="Municipal Water Providers",Description="Municipal water providers")
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="WaterProvidersGroup",Name="Municipal Water Providers",Description="Municipal water providers",InsertPosition="Top")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterProvidersLayer",GeoLayerViewID="WaterProvidersLayerView",Name="Municipal Water Providers",Description="Municipal water providers",InsertPosition="Top",Properties="docPath:'layers/water-providers.md'")
# For now use single symbol
# - TODO smalers 2020-05-22 need to enable a graduated symbol based on flow value
SetGeoLayerViewSingleSymbol(GeoLayerViewID="WaterProvidersLayerView",Name="Municipal Water Providers",Description="municipal water providers",Properties="symbolImage:/img/drinkingwater-32x37.png,imageAnchorPoint:Bottom")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterProvidersLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/water-providers-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterProvidersLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/water-providers-event-config.json")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="WaterProvidersProject",Indent="2",OutputFile="water-providers-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="water-providers-map.json",DestinationFile="${MapFolder}/water-providers-map.json")
CopyFile(SourceFile="water-providers-map.md",DestinationFile="${MapFolder}/water-providers-map.md")
#
#CopyFile(SourceFile="layers/co-dwr-water-district-4-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-district-4-classify-district.csv")
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4-event-config.json",DestinationFile="${MapFolder}/layers/co-dwr-water-district-4-event-config.json")
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4.md",DestinationFile="${MapFolder}/layers/co-dwr-water-district-4.md")
#
CopyFile(SourceFile="layers/fire-protection-districts.md",DestinationFile="${MapFolder}/layers/fire-protection-districts.md")
CopyFile(SourceFile="layers/fire-protection-districts-event-config.json",DestinationFile="${MapFolder}/layers/fire-protection-districts-event-config.json")
#
CopyFile(SourceFile="layers/water-conservancy-districts.md",DestinationFile="${MapFolder}/layers/water-conservancy-districts.md")
CopyFile(SourceFile="layers/water-conservancy-districts-event-config.json",DestinationFile="${MapFolder}/layers/water-conservancy-districts-event-config.json")
#
##CopyFile(SourceFile="layers/denver-water-boundary.geojson",DestinationFile="${MapFolder}/layers/denver-water-boundary.geojson")
##CopyFile(SourceFile="layers/denver-water-boundary.md",DestinationFile="${MapFolder}/layers/denver-water-boundary.md")
##CopyFile(SourceFile="layers/denver-water-boundary-event-config.json",DestinationFile="${MapFolder}/layers/denver-water-boundary-event-config.json")
#
#CopyFile(SourceFile="layers/water-provider-boundaries-dola.geojson",DestinationFile="${MapFolder}/layers/water-provider-boundaries-dola.geojson")
CopyFile(SourceFile="layers/water-provider-boundaries-dola.md",DestinationFile="${MapFolder}/layers/water-provider-boundaries-dola.md")
CopyFile(SourceFile="layers/water-provider-boundaries-dola-event-config.json",DestinationFile="${MapFolder}/layers/water-provider-boundaries-dola-event-config.json")
#
#CopyFile(SourceFile="layers/water-provider-boundaries.geojson",DestinationFile="${MapFolder}/layers/water-provider-boundaries.geojson")
CopyFile(SourceFile="layers/water-provider-boundaries.md",DestinationFile="${MapFolder}/layers/water-provider-boundaries.md")
CopyFile(SourceFile="layers/water-provider-boundaries-event-config.json",DestinationFile="${MapFolder}/layers/water-provider-boundaries-event-config.json")
#
CopyFile(SourceFile="layers/water-providers.md",DestinationFile="${MapFolder}/layers/water-providers.md")
CopyFile(SourceFile="layers/water-providers-event-config.json",DestinationFile="${MapFolder}/layers/water-providers-event-config.json")
