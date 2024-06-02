# Create a GeoMapProject file for legislative districts for the Poudre Basin
# - read the previously downloaded layer file
# - focus on Poudre Basin
# - TODO smalers 2020-08-16 need to re-add county boundaries and county and federal districts
# - output to the web folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/BasinEntities/Political-LegislativeDistricts")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  LegislativeDistrictsProject
# - GeoMapID:  LegislativeDistrictsMap
CreateGeoMapProject(NewGeoMapProjectID="LegislativeDistrictsProject",ProjectType="SingleMap",Name="CO Legislative Districts",Description="Colorado legislative districts",Properties="author:'Open Water Foundation',specificationFlavor:'',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="LegislativeDistrictsMap",Name="Colorado Legislative Districts",Description="Colorado legislative districts",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.385,40,8',docPath:legislative-districts-map.md")
AddGeoMapToGeoMapProject(GeoMapProjectID="LegislativeDistrictsProject",GeoMapID="LegislativeDistrictsMap")
# = = = = = = = = = =
# Background layers:  read layers and add a layer view group
# GeoLayerViewGroupID: BackgroundGroup
# - add tile servers from MapBox, Esri, and Google
#
# Mapbox background layers
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="BackgroundGroup",Name="Background Layers",Description="Background maps from image servers.",Properties="isBackground: true, selectedInitial: true")
#
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
# Water division:  read layer and add to a layer view group.
# GeoLayerViewGroupID: WaterDistrictsGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="WaterDistrictsGroup",Name="CO DWR Division 1 Water Districts",Description="Water District boundaries for Division 1 from the Colorado Division of Water Resources.",Properties="selectedInitial: true",InsertPosition="Top")
#
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-division.md",DestinationFile="layers/co-dwr-water-division.md")
# Don't copy because want to change output slightly
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-division-classify-division.csv",DestinationFile="layers/co-dwr-water-division-classify-division.csv")
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dwr/divisions/co-dwr-division-1.geojson",GeoLayerID="WaterDivisionLayer",Name="CO DWR Division 1",Description="Water Division 1 boundary from the Colorado Division of Water Resources.")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDivisionLayer",GeoLayerViewID="WaterDivisionLayerView",Name="CO DWR Division 1",Description="Boundary for Division 1 from the Colorado Division of Water Resources",Properties="docPath:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-division.md",InsertPosition="Top")
# Use color specific to this map.
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="WaterDivisionLayerView",Name="Colorize divisions",Description="Symbol for the division",ClassificationAttribute="DIV",Properties="classificationFile:'layers/co-dwr-water-division-classify-division.csv'")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterDivisionLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-division-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterDivisionLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-division-event-config.json")
# = = = = = = = = = =
# Water district 3:  read layer and add to layer view group.
# GeoLayerViewGroupID: WaterDistrictsGroup
# - group added above
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3.md",DestinationFile="layers/co-dwr-water-district-3.md")
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="layers/co-dwr-water-district-3-classify-district.csv")
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dwr/districts/co-dwr-district-3.geojson",GeoLayerID="WaterDistrictLayer",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources.")
AddGeoLayerViewToGeoMap(GeoLayerID="WaterDistrictLayer",GeoLayerViewID="WaterDistrictLayerView",Name="CO DWR Water District 3",Description="Water District 3 boundary from the Colorado Division of Water Resources",Properties="docPath:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3.md",InsertPosition="Top")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="WaterDistrictLayerView",Name="Colorize district",Description="Show Water District 3 in black.",ClassificationAttribute="DISTRICT",Properties="classificationFile:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-classify-district.csv")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterDistrictLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="WaterDistrictLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-event-config.json")
# = = = = = = = = = =
# State house districts:  read layer and add to a layer view group.
# GeoLayerViewGroupID: StateLegislativeDistrictsGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="StateLegislativeDistrictsGroup",Name="State Legislative Districts",Description="Colorado State legislative districts",Properties="selectBehavior:Single",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/circ/legislative-districts/2021/co-state-house-districts-2021.geojson",GeoLayerID="StateHouseLegislativeDistrictsLayer",Name="State House Districts (2021)",Description="Colorado State House districts (2021)")
AddGeoLayerViewToGeoMap(GeoLayerID="StateHouseLegislativeDistrictsLayer",GeoLayerViewID="StateHouseDistrictsLayerView",Name="State House Districts (2021)",Description="Colorado State House districts from 2021 redistricting",Properties="docPath:layers/co-state-house-districts-2021.md,highlightEnabled:true,highlightEnabled:true")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="StateHouseDistrictsLayerView",Name="Colorize state house districts",Description="Show each district the same color except those that overlap the Poudre",ClassificationAttribute="District",Properties="classificationType:'categorized',classificationFile:'layers/co-state-house-districts-2021-classify-district.csv'")
# Currently no graphs
#SetGeoLayerViewEventHandler(GeoLayerViewID="StateHouseDistrictsLayerView",EventType="click",Properties="popupConfigPath:graphs/county-popup-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="StateHouseDistrictsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/co-state-house-districts-2021-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="StateHouseDistrictsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/co-state-house-districts-2021-event-config.json")
# = = = = = = = = = =
# State senate districts:  read layer and add to a layer view group.
# GeoLayerViewGroupID: StateLegislativeDistrictsGroup
# - group added above
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/circ/legislative-districts/2021/co-state-senate-districts-2021.geojson",GeoLayerID="StateSenateLegislativeDistrictsLayer",Name="State Senate Districts (2021)",Description="Colorado State Senate districts (2021)")
AddGeoLayerViewToGeoMap(GeoLayerID="StateSenateLegislativeDistrictsLayer",GeoLayerViewID="StateSenateDistrictsLayerView",Name="State Senate Districts (2021)",Description="Colorado State Senate districts from 2021 redistricting",Properties="docPath:layers/co-state-senate-districts-2021.md,highlightEnabled:true,highlightEnabled:true")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="StateSenateDistrictsLayerView",Name="Colorize state senate districts",Description="Show each district the same color except those that overlap the Poudre",ClassificationAttribute="District",Properties="classificationType:'categorized',classificationFile:'layers/co-state-senate-districts-2021-classify-district.csv'")
# Currently no graphs
SetGeoLayerViewEventHandler(GeoLayerViewID="StateSenateDistrictsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/co-state-senate-districts-2021-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="StateSenateDistrictsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/co-state-senate-districts-2021-event-config.json")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="LegislativeDistrictsProject",Indent="2",OutputFile="legislative-districts-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="legislative-districts-map.json",DestinationFile="${MapFolder}/legislative-districts-map.json")
CopyFile(SourceFile="legislative-districts-map.md",DestinationFile="${MapFolder}/legislative-districts-map.md")
# -----
# Layers
CopyFile(SourceFile="layers/co-dwr-water-division-classify-division.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-division-classify-division.csv")
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-division.md",DestinationFile="${MapFolder}/layers/co-dwr-water-division.md")
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-division-event-config.json",DestinationFile="${MapFolder}/layers/co-dwr-water-division-event-config.json")
#
#CopyFile(SourceFile="layers/co-dwr-water-district-3.md",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3.md")
#CopyFile(SourceFile="layers/co-dwr-water-district-3-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3-classify-district.csv")
#CopyFile(SourceFile="../Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-3-event-config.json",DestinationFile="${MapFolder}/layers/co-dwr-water-district-3-event-config.json")
#
#CopyFile(SourceFile="layers/counties.geojson",DestinationFile="${MapFolder}/layers/counties.geojson")
#CopyFile(SourceFile="layers/counties-classify-county.csv",DestinationFile="${MapFolder}/layers/counties-classify-county.csv")
#
CopyFile(SourceFile="layers/co-state-house-districts-2021-classify-district.csv",DestinationFile="${MapFolder}/layers/co-state-house-districts-2021-classify-district.csv")
CopyFile(SourceFile="layers/co-state-house-districts-2021.md",DestinationFile="${MapFolder}/layers/co-state-house-districts-2021.md")
CopyFile(SourceFile="layers/co-state-house-districts-2021-event-config.json",DestinationFile="${MapFolder}/layers/co-state-house-districts-2021-event-config.json")
#
CopyFile(SourceFile="layers/co-state-senate-districts-2021-classify-district.csv",DestinationFile="${MapFolder}/layers/co-state-senate-districts-2021-classify-district.csv")
CopyFile(SourceFile="layers/co-state-senate-districts-2021.md",DestinationFile="${MapFolder}/layers/co-state-senate-districts-2021.md")
CopyFile(SourceFile="layers/co-state-senate-districts-2021-event-config.json",DestinationFile="${MapFolder}/layers/co-state-senate-districts-2021-event-config.json")
#
#CopyFile(SourceFile="../../SupportingData/Physical-ContinentalDivide/layers/continental-divide-co-event-config.json",DestinationFile="${MapFolder}/layers/continental-divide-co-event-config.json")
#CopyFile(SourceFile="../../SupportingData/Physical-ContinentalDivide/layers/continental-divide.md",DestinationFile="${MapFolder}/layers/continental-divide.md")
#
#CopyFile(SourceFile="../../SupportingData/Political-ColoradoStateBoundary/layers/co-state-boundary.md",DestinationFile="${MapFolder}/layers/co-state-boundary.md")
