# Create a GeoMapProject file for current flood conditions:
# - output to the web folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/CurrentConditions/Environment-Floods")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  FloodsProject
# - GeoMapID:  CurrentFloodsMap
CreateGeoMapProject(NewGeoMapProjectID="FloodsProject",ProjectType="SingleMap",Name="Floods",Description="Floods",Properties="author:'Open Water Foundation',specificationFlavor:'',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="CurrentFloodsMap",Name="Flood Conditions",Description="Flood conditions",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.4,40.43,10',docPath:floods-map.md")
AddGeoMapToGeoMapProject(GeoMapProjectID="FloodsProject",GeoMapID="CurrentFloodsMap")
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
# National parks:  read layer and add to a layer view group.
# GeoLayerViewGroupID: NationalParksGroup
#
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="NationalParksGroup",Name="National Parks",Description="National parks",Properties="selectedInitial:true",InsertPosition="Top")
#
# Use the GeoJSON dataset
#ReadGeoLayerFromGeoJSON(InputFile="https://services1.arcgis.com/fBc8EJBxQRMcHlei/arcgis/rest/services/ROMO_BND_Boundary_py_NAD83_1/FeatureServer/0/query?geometry=-109.05%2C36.99%2C-102.05%2C41&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelContains&outFields=*&geometryPrecision=5&f=geojson",GeoLayerID="RMNPBoundaryLayer",Name="RMNP Boundary",Description="Rocky Mountain National Parck boundary web service")
ReadGeoLayerFromGeoJSON(InputFile="https://opendata.arcgis.com/datasets/7cb5f22df8c44900a9f6632adb5f96a5_0.geojson",GeoLayerID="RMNPBoundaryLayer",Name="RMNP Boundary",Description="Rocky Mountain National Park boundary web service")
AddGeoLayerViewToGeoMap(GeoLayerID="RMNPBoundaryLayer",GeoLayerViewID="RMNPBoundaryLayerView",Name="RMNP Boundary",Description="Rocky Mountain National Park boundary from National Park Service",Properties="docPath:../Environment-WildFires/layers/national-parks-rmnp.md")
# Use #339933 - dark green
SetGeoLayerViewSingleSymbol(GeoLayerViewID="RMNPBoundaryLayerView",Name="RMNPBoundarySymbol",Description="RMNP boundaries symbol",Properties="color:#339933,fillColor:#339933,fillOpacity:0.3")
SetGeoLayerViewEventHandler(GeoLayerViewID="RMNPBoundaryLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../Environment-Wildfires/layers/national-parks-rmnp-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="RMNPBoundaryLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../Environment-Wildfires/layers/national-parks-rmnp-event-config.json")
# = = = = = = = = = =
# SNODAS snow:  read layer and add to a layer view group.
# GeoLayerViewGroupID: SnowpackBasinsGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="SnowpackBasinsGroup",Name="Snowpack",Description="Snowpack conditions",InsertPosition="Top")
#
# Use the current GeoJSON file from the SNODAS tools website
# - TODO smalers 2021-04-20 this is old GeoJSON which causes problems for InfoMapper
ReadGeoLayerFromGeoJSON(InputFile="https://snodas.cdss.state.co.us/app/SnowpackStatisticsByDate/SnowpackStatisticsByDate_LatestDate.geojson",GeoLayerID="SnodasLayer",Name="Snowpack (SNODAS)",Description="Snowpack from SNODAS")
AddGeoLayerViewToGeoMap(GeoLayerID="SnodasLayer",GeoLayerViewID="SnodasLayerView",Name="Snowpack (SNODAS)",Description="Snowpack from SNODAS as basin mean SWE (in)",Properties="docPath:../WaterSupply-Snowpack/layers/snodas.md,refreshInterval:6Hour")
# Use graduated symbol the same as the SNODAS website.
SetGeoLayerViewEventHandler(GeoLayerViewID="SnodasLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../WaterSupply-Snowpack/layers/snodas-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="SnodasLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../WaterSupply-Snowpack/layers/snodas-event-config.json")
SetGeoLayerViewGraduatedSymbol(GeoLayerViewID="SnodasLayerView",Name="Colorize SWE",Description="Show SWE using SNODAS tools colors.",ClassificationAttribute="SNODAS_SWE_Mean_in",Properties="classificationFile:../WaterSupply-Snowpack/layers/snodas-classify-swe-in.csv")
# = = = = = = = = = =
# Wildfire Perimeters (historical archive):  read layer and add to a layer view group.
# GeoLayerViewGroupID: WildfiresGroup
# - get under ESRI map server 1000 feature limit, so limit to:
# FIRE_YEAR >= 2000
# GIS_ACRES >= 150  (previously used 100 but when increased buffer to include more adjoining states had to increase)
# Use a boundary that encloses enough of adjoining states to include fires in neighboring states.
#
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="WildfiresGroup",Name="Wildfires",Description="Wildfires",Properties="selectedInitial:true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://services3.arcgis.com/T4QMspbfLg3qTGWY/arcgis/rest/services/InteragencyFirePerimeterHistory_All_Years_View/FeatureServer/0/query?where=GIS_ACRES%20%3E%3D%20150%20AND%20FIRE_YEAR%20%3E%3D%202000&geometry=-110.6%2C35.86%2C-102.05%2C42.2&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelContains&outFields=*&geometryPrecision=5&f=geojson",GeoLayerID="WildfirePerimetersArchiveLayer",Name="Historical Wildfire Perimeters",Description="Wildfire perimeters web service")
AddGeoLayerViewToGeoMap(GeoLayerID="WildfirePerimetersArchiveLayer",GeoLayerViewID="WildfirePerimetersArchiveLayerView",Name="Historical Wildfire Perimeters",Description="Historical wildfire perimeters (acres>= 150, year>=2000) from the National Interagency Fire Center",Properties="docPath:../Environment-Wildfires/layers/wildfire-perimeters-archive.md",InsertPosition="Top")
# Change from filled polygons to only outlines
#SetGeoLayerViewSingleSymbol(GeoLayerViewID="WildfirePerimetersArchiveLayerView",Name="WildfirePerimetersArchiveSymbol",Description="Wildfire Perimeters archive symbol",Properties="color:#cc9900,fillColor:#cc9900,fillOpacity:0.3")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="WildfirePerimetersArchiveLayerView",Name="WildfirePerimetersArchiveSymbol",Description="Wildfire Perimeters archive symbol",Properties="color:#cc9900,fillColor:#cc9900,fillOpacity:0.2")
# Outlines don't look good
#SetGeoLayerViewSingleSymbol(GeoLayerViewID="WildfirePerimetersArchiveLayerView",Name="WildfirePerimetersArchiveSymbol",Description="Wildfire Perimeters archive symbol",Properties="color:#cc9900,fillColor:#000000,fillOpacity:0.0")
SetGeoLayerViewEventHandler(GeoLayerViewID="WildfirePerimetersArchiveLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../Environment-Wildfires/layers/wildfire-perimeters-archive-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="WildfirePerimetersArchiveLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../Environment-Wildfires/layers/wildfire-perimeters-archive-event-config.json")
# = = = = = = = = = =
# Wildfire Perimeters (current fires):  read layer and add to a layer view group.
# GeoLayerViewGroupID: WildfiresGroup
#
# TODO smalers 2020-08-14 Use a file for now but get the WFS working
# - set to LocalFile for prepreocessed GeoJSON file
# - set to GeoJSONService for GeoJSON returned from service
# - set to WFSGeoJSON to use WFS and return a GeoJSON
# SetProperty(PropertyName="PerimeterSource",PropertyType="str",PropertyValue="LocalFile")
#SetProperty(PropertyName="PerimeterSource",PropertyType="str",PropertyValue="WFSGeoJSON")
SetProperty(PropertyName="PerimeterSource",PropertyType="str",PropertyValue="GeoJSONFromWFS")
If(Name="UseFileIf",Condition="${PerimeterSource} == LocalFile")
    # Reading from a local file...
    ReadGeoLayerFromGeoJSON(InputFile="layers/wildfire-perimeters.geojson",GeoLayerID="WildfirePerimetersLayer",Name="Current Year Wildfire Perimeters",Description="Colorado wildfire Perimeters from the National Interagency Fire Center")
EndIf(Name="UseFileIf")
If(Name="UseGeoJSONServiceIf",Condition="${PerimeterSource} == GeoJSONService")
    # If reading from the FWS...
    ReadGeoLayerFromGeoJSON(InputFile="https://opendata.arcgis.com/datasets/5da472c6d27b4b67970acc7b5044c862_0.geojson",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimeters",Description="Colorado wildfire Perimeters from the National Interagency Fire Center",Properties="sourceFormat:WFS")
EndIf(Name="UseGeoJSONServiceIf")
If(Name="UseWFSGeoJSONIf",Condition="${PerimeterSource} == WFSGeoJSON")
    # If reading from the WFS...
    # Does not work...
    # ReadGeoLayerFromWebFeatureService(InputUrl="https://services3.arcgis.com/T4QMspbfLg3qTGWY/arcgis/rest/services/Public_Wildfire_Perimeters_View/FeatureServer/0/query?outFields=*&where=1%3D1",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimeters",Description="Colorado wildfire perimeters web service")
    # Works but URL is too long
    # - TODO smalers 2020-08-19
    # - Can return GeoJSON, but in this case just use ReadGeoLayerFromGeoJSON
    # ReadGeoLayerFromWebFeatureService(InputUrl="https://services3.arcgis.com/T4QMspbfLg3qTGWY/ArcGIS/rest/services/Public_Wildfire_Perimeters_View/FeatureServer/0/query?where=1%3D1&objectIds=&time=&geometry=-109.05%2C36.99%2C-102.05%2C41&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelContains&resultType=none&distance=0.0&units=esriSRUnit_Meter&returnGeodetic=false&outFields=*&returnGeometry=true&returnCentroid=false&featureEncoding=esriDefault&multipatchOption=xyFootprint&maxAllowableOffset=&geometryPrecision=&outSR=&datumTransformation=&applyVCSProjection=false&returnIdsOnly=false&returnUniqueIdsOnly=false&returnCountOnly=false&returnExtentOnly=false&returnQueryGeometry=false&returnDistinctValues=false&cacheHint=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&having=&resultOffset=&resultRecordCount=&returnZ=false&returnM=false&returnExceededLimitFeatures=true&quantizationParameters=&sqlFormat=none&f=pgeojson&token=",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimeters",Description="Colorado wildfire perimeters web service")
EndIf(Name="UseWFSGeoJSONIf")
If(Name="UseGeoJSONFromWFSIf",Condition="${PerimeterSource} == GeoJSONFromWFS")
    # If reading from the WFS...
    # Does not work...
    # ReadGeoLayerFromWebFeatureService(InputUrl="https://services3.arcgis.com/T4QMspbfLg3qTGWY/arcgis/rest/services/Public_Wildfire_Perimeters_View/FeatureServer/0/query?outFields=*&where=1%3D1",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimeters",Description="Colorado wildfire perimeters web service")
    # Works but URL is too long
    # - TODO smalers 2020-08-19
    # - Can return GeoJSON, but in this case just use ReadGeoLayerFromGeoJSON
    # The following uses a minimual number of parameters, shown without URL encoding:
    # - where=1=1 (why needed?)
    # - geometryType=esriGeometryEnvelope (used to specify rectangle for query)
    # - geometry=xmin,xmax,ymin,ymax  (where x is longitude and y is latitude, must URL-encode commas using %2C)
    # - inSR=4326 (input CRS, for the bounding box, default is that of the layer on the server)
    # - returnGeometry=true (default, to return geometries)
    # - f=pgeojson (pretty GeoJSON)
    # - f=geojson (GeoJSON)
    # - outfields=* (return all attributes)
    # - geometryPrecision=5 (digits for coordinates)
    # - outSR (seems to default to 4326 for GeoJSON output format)
    # - multipatchOption (is this needed?)
    # - spatialRel=esriSpatialRelContains (how the envelope is used to select features)
    # TODO smalers 2021-07-12 the following no longer works.
    #ReadGeoLayerFromGeoJSON(InputFile="https://services3.arcgis.com/T4QMspbfLg3qTGWY/ArcGIS/rest/services/Public_Wildfire_Perimeters_View/FeatureServer/0/query?geometry=-110.6%2C35.86%2C-102.05%2C42.2&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelContains&outFields=*&geometryPrecision=5&f=geojson",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimeters",Description="Colorado wildfire perimeters web service")
    # Worked until 2023?
    #ReadGeoLayerFromGeoJSON(InputFile="https://services3.arcgis.com/T4QMspbfLg3qTGWY/arcgis/rest/services/CY_WildlandFire_Perimeters_ToDate/FeatureServer/0/query?geometry=-110.6%2C35.86%2C-102.05%2C42.2&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelContains&outFields=*&geometryPrecision=5&f=geojson",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimeters",Description="Colorado wildfire perimeters web service")
    # Works for 2023.
    ReadGeoLayerFromGeoJSON(InputFile="https://services3.arcgis.com/T4QMspbfLg3qTGWY/ArcGIS/rest/services/WFIGS_Interagency_Perimeters_YearToDate/FeatureServer/0/query?geometry=-110.6%2C35.86%2C-102.05%2C42.2&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelContains&outFields=*&geometryPrecision=5&f=geojson",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimeters",Description="Colorado wildfire perimeters web service")
    #
    # The following uses too many parameters based on the Esri URL-builder, which are difficult for a user to deal with.
    #ReadGeoLayerFromGeoJSON(InputFile="https://services3.arcgis.com/T4QMspbfLg3qTGWY/ArcGIS/rest/services/Public_Wildfire_Perimeters_View/FeatureServer/0/query?where=1%3D1&objectIds=&time=&geometry=-109.05%2C36.99%2C-102.05%2C41&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelContains&resultType=none&distance=0.0&units=esriSRUnit_Meter&returnGeodetic=false&outFields=*&returnGeometry=true&returnCentroid=false&featureEncoding=esriDefault&multipatchOption=xyFootprint&maxAllowableOffset=&geometryPrecision=&outSR=&datumTransformation=&applyVCSProjection=false&returnIdsOnly=false&returnUniqueIdsOnly=false&returnCountOnly=false&returnExtentOnly=false&returnQueryGeometry=false&returnDistinctValues=false&cacheHint=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&having=&resultOffset=&resultRecordCount=&returnZ=false&returnM=false&returnExceededLimitFeatures=true&quantizationParameters=&sqlFormat=none&f=pgeojson&token=",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimeters",Description="Colorado wildfire perimeters web service")
EndIf(Name="UseGeoJSONFromWFSIf")
AddGeoLayerViewToGeoMap(GeoLayerID="WildfirePerimetersLayer",GeoLayerViewID="WildfirePerimetersLayerView",Name="Current Year Wildfire Perimeters",Description="Current year wildfire perimeters from the National Interagency Fire Center",Properties="docPath:../Environment-Wildfires/layers/wildfire-perimeters.md",InsertPosition="Top")
# Switch from solid fill to only outline
#SetGeoLayerViewSingleSymbol(GeoLayerViewID="WildfirePerimetersLayerView",Name="WildfirePerimetersSymbol",Description="Wildfire Perimeters symbol",Properties="color:#ff0000,fillColor:#ff0000,fillOpacity:0.3")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="WildfirePerimetersLayerView",Name="WildfirePerimetersSymbol",Description="Wildfire Perimeters symbol",Properties="color:#ff0000,fillColor:#000000,fillOpacity:0.0")
# TODO smalers 2020-08-14 need to classify on area or some other attribute
#SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="WildfirePerimetersLayerView",Name="Colorize wildfire Perimeters",Description="Show each wildfire perimeter the same color",ClassificationAttribute="county",Properties="classificationType:'categorized',classificationFile:'layers/wildfire-perimeters-classify-county.csv'")
# Same event handler configuration, since just limits features
SetGeoLayerViewEventHandler(GeoLayerViewID="WildfirePerimetersLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../Environment-Wildfires/layers/wildfire-perimeters-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="WildfirePerimetersLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../Environment-Wildfires/layers/wildfire-perimeters-event-config.json")
# = = = = = = = = = =
# Soil Burn Severity:  read layer and add to a layer view group.
# GeoLayerViewGroupID: SoilBurnSeverityGroup
#
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="SoilBurnSeverityGroup",Name="Soil Burn Severity",Description="Soil burn severity",Properties="selectedInitial:true",InsertPosition="Top")
# -------------------
# Soil Burn Severity for East Troublesome (raster):
# GeoLayerViewGroupID: SoilBurnSeverityGroup
# - raster is faster
ReadRasterGeoLayerFromFile(InputFile="https://data.openwaterfoundation.org/country/us/usfs/baer/2020/east-troublesome/east-troublesome-2020-sbs.tif",GeoLayerID="EastTroublesomeSoilBurnSeverityRasterLayer",Name="East Troublesome Fire Soil Burn Severity (raster)",Description="East Troublesome Fire soil burn severity")
AddGeoLayerViewToGeoMap(GeoLayerID="EastTroublesomeSoilBurnSeverityRasterLayer",GeoLayerViewID="EastTroublesomeSoilBurnSeverityRasterLayerView",Name="East Troublesome Fire Soil Burn Severity (raster)",Description="East Troublesome Fire soil burn severity from USFS BAER",Properties="docPath:../Environment-Wildfires/layers/east-troublesome-sbs.md",InsertPosition="Top")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="EastTroublesomeSoilBurnSeverityRasterLayerView",Name="Colorize soil burn severity",Description="Symbol for the soil burn severity",ClassificationAttribute="1",Properties="classificationFile:'../Environment-Wildfires/layers/east-troublesome-sbs-classify-gridcode.csv',rasterResolution:'128'")
SetGeoLayerViewEventHandler(GeoLayerViewID="EastTroublesomeSoilBurnSeverityRasterLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../Environment-Wildfires/layers/east-troublesome-sbs-raster-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="EastTroublesomeSoilBurnSeverityRasterLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../Environment-Wildfires/layers/east-troublesome-sbs-raster-event-config.json")
# -------------------
# Soil Burn Severity for Cameron Peak (raster):
# GeoLayerViewGroupID: SoilBurnSeverityGroup
# - raster is faster
ReadRasterGeoLayerFromFile(InputFile="https://data.openwaterfoundation.org/country/us/usfs/baer/2020/cameron-peak/cameron-peak-2020-sbs.tif",GeoLayerID="CameronPeakSoilBurnSeverityRasterLayer",Name="Cameron Peak Fire Soil Burn Severity (raster)",Description="Cameron Peak Fire soil burn severity")
AddGeoLayerViewToGeoMap(GeoLayerID="CameronPeakSoilBurnSeverityRasterLayer",GeoLayerViewID="CameronPeakSoilBurnSeverityRasterLayerView",Name="Cameron Peak Fire Soil Burn Severity (raster)",Description="Cameron Peak Fire soil burn severity from USFS BAER",Properties="docPath:../Environment-Wildfires/layers/cameron-peak-sbs.md",InsertPosition="Top")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="CameronPeakSoilBurnSeverityRasterLayerView",Name="Colorize soil burn severity",Description="Symbol for the soil burn severity",ClassificationAttribute="1",Properties="classificationFile:'../Environment-Wildfires/layers/cameron-peak-sbs-classify-gridcode.csv',rasterResolution:'128'")
SetGeoLayerViewEventHandler(GeoLayerViewID="CameronPeakSoilBurnSeverityRasterLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../Environment-Wildfires/layers/cameron-peak-sbs-raster-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="CameronPeakSoilBurnSeverityRasterLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../Environment-Wildfires/layers/cameron-peak-sbs-raster-event-config.json")
# = = = = = = = = = =
# HUC:  read layer and add to layer view group.
# GeoLayerViewGroupID: HUCsGroup
#
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="HUCBasinsGroup",Name="Hydrologic Unit Code (HUC) Basins",Description="HUC Basin boundaries from the USGS.",Properties="selectedInitial: true",InsertPosition="Top")
# HUC 12 next on top
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/country/us/usgs/huc-basins/huc12-basins-10190006-big-thompson.geojson",GeoLayerID="HUC12BasinLayer",Name="Big Thompson HUC12 Basins",Description="HUC12 Basin boundaries from the USGS")
AddGeoLayerViewToGeoMap(GeoLayerID="HUC12BasinLayer",GeoLayerViewID="HUC12BasinsLayerView",Name="Big Thompson HUC 12 Basins",Description="HUC12 Basin boundaries from the USGS",InsertPosition="Top",Properties="docPath:../../BasinEntities/Physical-Basins/layers/huc12.md,highlightEnabled:true")
# Width of 2 is a bit overwhelming.  Use the same color as the basins map.
SetGeoLayerViewSingleSymbol(GeoLayerViewID="HUC12BasinsLayerView",Name="Colorize HUC12",Description="Transparent polygon",Properties="color:#663300,width:.5,fillOpacity:0.0")
SetGeoLayerViewEventHandler(GeoLayerViewID="HUC12BasinsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../../BasinEntities/Physical-Basins/layers/huc12-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="HUC12BasinsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../../BasinEntities/Physical-Basins/layers/huc12-event-config.json")
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
/*
#  # = = = = = = = = = =
#  # Snow stations:  read layer and add to a layer view group.
#  # GeoLayerViewGroupID: SnowStationsGroup
#  AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="SnowStationsGroup",Name="Snow Stations",Description="Snow stations",Properties="selectedInitial: true",InsertPosition="Top")
#  #
#  CopyFile(SourceFile="../WaterSupply-Snowpack/layers/snotel-stations.geojson",DestinationFile="layers/snotel-stations.geojson")
#  CopyFile(SourceFile="../WaterSupply-Snowpack/layers/snotel-stations.md",DestinationFile="layers/snotel-stations.md")
#  CopyFile(SourceFile="../WaterSupply-Snowpack/layers/snotel-stations-event-config.json",DestinationFile="layers/snotel-stations-event-config.json")
#  ReadGeoLayerFromGeoJSON(InputFile="layers/snotel-stations.geojson",GeoLayerID="SnotelStationsLayer",Name="SNOTEL Stations",Description="SNOTEL stations from NRCS")
#  AddGeoLayerViewToGeoMap(GeoLayerID="SnotelStationsLayer",GeoLayerViewID="SnotelStationsLayerView",Name="SNOTEL Stations",Description="SNOTEL stations from NRCS",Properties="docPath:'layers/snotel-stations.md'")
#  # For now use single symbol
#  # - TODO smalers 2020-05-22 need to enable a graduated symbol based on SWE value
#  SetGeoLayerViewSingleSymbol(GeoLayerViewID="SnotelStationsLayerView",Name="SNOTEL Stations",Description="SNOTEL stations from NRCS",Properties="symbolShape:Circle,color:black,fillColor:black,symbolSize:4,sizeUnits:pixels,opacity:1.0,fillOpacity:1.0,weight:1.5")
#  SetGeoLayerViewEventHandler(GeoLayerViewID="SnotelStationsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/snotel-stations-event-config.json")
#  SetGeoLayerViewEventHandler(GeoLayerViewID="SnotelStationsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/snotel-stations-event-config.json")
*/
# = = = = = = = = = =
# Flood Organizations:  read layer and add to the layer view group.
# GeoLayerViewGroupID: FloodOrgsGroup
# = = = = = = = = = =
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="FloodOrgsGroup",Name="Flood Organizations",Description="Flood organizations (regulation, etc.)",Properties="selectedInitial: true",InsertPosition="Top")
#
# Organization offices:  read layer and add to the same layer group
# GeoLayerViewGroupID: FloodControlGroup
# - group was added above
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/owf/flood-orgs/co-flood-orgs.geojson",GeoLayerID="FloodOrgsLayer",Name="Flood Organizations",Description="Flood organizations (regulation, etc.)")
AddGeoLayerViewToGeoMap(GeoLayerID="FloodOrgsLayer",GeoLayerViewID="FloodOrgsLayerView",Name="Flood Organizations",Description="Flood organizations (regulation, etc.)",Properties="docPath:layers/flood-orgs.md",InsertPosition="Top")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="FloodOrgsLayerView",Name="Use marker image for offices",Description="Use marker image for offices",Properties="symbolImage:/img/office-building-32x37.png,imageAnchorPoint:Bottom")
SetGeoLayerViewEventHandler(GeoLayerViewID="FloodOrgsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/flood-orgs-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="FloodOrgsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/flood-orgs-event-config.json")
# = = = = = = = = = =
# Flood warning system water level stations:
# - read layers and add to a layer view group
# GeoLayerViewGroupID: FloodWarningWaterLevelGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="FloodWarningWaterLevelGroup",Name="Flood Warning Water Level Stations",Description="Flood Warning System water level information",Properties="selectedInitial: true",InsertPosition="Top")
#
# Water level stations:
# - use a larger circle under precipitation
# Read FWS stations from web services:
# - the mouse events are configured to link to the NovaStar Operator station dashboard for each station
# - TODO smalers 2022-07-06 need to enable WaterLevelRiver-NovaScore and other NovaScore time series
ReadGeoLayerFromGeoJSON(InputFile="https://larimerco-ns5.trilynx-novastar.systems/novastar/data/api/v1/stationStatistics?dataType=WaterLevelRiver&statistic=Last&interval=1Day&format=geojson&statisticFormat=flat&statisticValueName=%24%7BdataType%7D.%24%7Binterval%7D",GeoLayerID="FloodWarningLevelStationsLayer",Name="Flood Warning System Water Level Stations",Description="Flood Warning System water level stations from Larimer County FWS")
AddGeoLayerViewToGeoMap(GeoLayerID="FloodWarningLevelStationsLayer",GeoLayerViewID="FloodWarningLevelStationsLayerView",Name="Flood Warning System Water Level Stations",Description="Flood Warning System water level stations from Larimer County FWS",Properties="docPath:'layers/fws-level-stations.md',refreshInterval:5Minute")
# For now use single symbol
# - TODO smalers 2020-05-22 need to enable a symbol based on water level or NovaScore
SetGeoLayerViewSingleSymbol(GeoLayerViewID="FloodWarningLevelStationsLayerView",Name="Flood Warning Water Level Stations",Description="Flood Warning System water level stations from Larimer County FWS",Properties="symbolShape:Circle,color:#333333,fillColor:#333333,symbolSize:6,sizeUnits:pixels,opacity:1.0,fillOpacity:1.0,weight:1.5")
#SetGeoLayerViewGraduatedSymbol(GeoLayerViewID="FloodWarningLevelStationsLayerView",Name="Colorize water level",Description="Color water level markers by NovaScore.",ClassificationAttribute="NovaScore-Last",Properties="symbolShape:Circle,symbolSize:6,sizeUnits:pixels,classificationFile:layers/fws-level-stations-classify.csv")
SetGeoLayerViewEventHandler(GeoLayerViewID="FloodWarningLevelStationsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/fws-level-stations-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="FloodWarningLevelStationsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/fws-level-stations-event-config.json")
# = = = = = = = = = =
# Flood warning system precipitation stations:
# - read layers and add to a layer view group
# - multiple layers are shown based on data type statistic, toggle only one on
# GeoLayerViewGroupID: FloodWarningPrecipGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="FloodWarningPrecipGroup",Name="Flood Warning Precipitation Stations",Description="Flood Warning System precipitation stations",Properties="selectedInitial: true,selectBehavior: single",InsertPosition="Top")
#
# Precipitation stations (3Hour).
# Read FWS stations from web services:
# - the mouse events are configured to link to the NovaStar Operator station dashboard for each station
ReadGeoLayerFromGeoJSON(InputFile="https://larimerco-ns5.trilynx-novastar.systems/novastar/data/api/v1/stationStatistics?dataType=Precip&statistic=Total&interval=3Hour&format=geojson&statisticFormat=flat&statisticValueName=%24%7BdataType%7D.%24%7Binterval%7D",GeoLayerID="FloodWarningPrecipStations3HourLayer",Name="3-Hour Precipitation",Description="3-hour precipitation from Larimer County FWS")
AddGeoLayerViewToGeoMap(GeoLayerID="FloodWarningPrecipStations3HourLayer",GeoLayerViewID="FloodWarningPrecipStations3HourLayerView",Name="3-Hour Precipitation",Description="3-hour precipitation from Larimer County FWS (using general precipitation levels for markers)",Properties="docPath:'layers/fws-precip-stations.md',selectedInitial:true,refreshInterval:5Minute")
SetGeoLayerViewGraduatedSymbol(GeoLayerViewID="FloodWarningPrecipStations3HourLayerView",Name="Colorize daily precipitation",Description="Color daily precipitation.",ClassificationAttribute="Precip.3Hour",Properties="symbolShape:Circle,symbolSize:4,sizeUnits:pixels,classificationFile:layers/fws-precip-stations-classify-3hour.csv")
SetGeoLayerViewEventHandler(GeoLayerViewID="FloodWarningPrecipStations3HourLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/fws-precip-stations-3hour-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="FloodWarningPrecipStations3HourLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/fws-precip-stations-3hour-event-config.json")
#
# Precipitation stations (1Day).
# Read FWS stations from web services:
# - the mouse events are configured to link to the NovaStar Operator station dashboard for each station
ReadGeoLayerFromGeoJSON(InputFile="https://larimerco-ns5.trilynx-novastar.systems/novastar/data/api/v1/stationStatistics?dataType=Precip&statistic=Total&interval=1Day&format=geojson&statisticFormat=flat&statisticValueName=%24%7BdataType%7D.%24%7Binterval%7D",GeoLayerID="FloodWarningPrecipStations1DayLayer",Name="1-Day Precipitation",Description="1-day Precipitation from Larimer County FWS")
AddGeoLayerViewToGeoMap(GeoLayerID="FloodWarningPrecipStations1DayLayer",GeoLayerViewID="FloodWarningPrecipStations1DayLayerView",Name="1-Day Precipitation",Description="1-day precipitation from Larimer County FWS (using general precipitation levels for markers)",Properties="docPath:'layers/fws-precip-stations.md',selectedInitial:false,refreshInterval:5Minute")
SetGeoLayerViewGraduatedSymbol(GeoLayerViewID="FloodWarningPrecipStations1DayLayerView",Name="Colorize daily precipitation",Description="Color daily precipitation.",ClassificationAttribute="Precip.1Day",Properties="symbolShape:Circle,symbolSize:4,sizeUnits:pixels,classificationFile:layers/fws-precip-stations-classify-1day.csv")
SetGeoLayerViewEventHandler(GeoLayerViewID="FloodWarningPrecipStations1DayLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/fws-precip-stations-1day-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="FloodWarningPrecipStations1DayLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/fws-precip-stations-1day-event-config.json")
#
# Precipitation stations (7Day).
# Read FWS stations from web services:
# - the mouse events are configured to link to the NovaStar Operator station dashboard for each station
ReadGeoLayerFromGeoJSON(InputFile="https://larimerco-ns5.trilynx-novastar.systems/novastar/data/api/v1/stationStatistics?dataType=Precip&statistic=Total&interval=7Day&format=geojson&statisticFormat=flat&statisticValueName=%24%7BdataType%7D.%24%7Binterval%7D",GeoLayerID="FloodWarningPrecipStations7DayLayer",Name="7-Day Precipitation",Description="7-day Precipitation from Larimer County FWS")
AddGeoLayerViewToGeoMap(GeoLayerID="FloodWarningPrecipStations7DayLayer",GeoLayerViewID="FloodWarningPrecipStations7DayLayerView",Name="7-Day Precipitation",Description="7-day precipitation from Larimer County FWS (using general precipitation levels for markers)",Properties="docPath:'layers/fws-precip-stations.md',selectedInitial:false,refreshInterval:5Minute")
SetGeoLayerViewGraduatedSymbol(GeoLayerViewID="FloodWarningPrecipStations7DayLayerView",Name="Colorize daily precipitation",Description="Color daily precipitation.",ClassificationAttribute="Precip.7Day",Properties="symbolShape:Circle,symbolSize:4,sizeUnits:pixels,classificationFile:layers/fws-precip-stations-classify-7day.csv")
SetGeoLayerViewEventHandler(GeoLayerViewID="FloodWarningPrecipStations7DayLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/fws-precip-stations-7day-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="FloodWarningPrecipStations7DayLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/fws-precip-stations-7day-event-config.json")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="FloodsProject",Indent="2",OutputFile="floods-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="floods-map.json",DestinationFile="${MapFolder}/floods-map.json")
CopyFile(SourceFile="floods-map.md",DestinationFile="${MapFolder}/floods-map.md")
# -----
# Layers
# Flood organizations
CopyFile(SourceFile="layers/flood-orgs.md",DestinationFile="${MapFolder}/layers/flood-orgs.md")
CopyFile(SourceFile="layers/flood-orgs-event-config.json",DestinationFile="${MapFolder}/layers/flood-orgs-event-config.json")
#
# Flood warning stations.
CopyFile(SourceFile="layers/fws-precip-stations.md",DestinationFile="${MapFolder}/layers/fws-precip-stations.md")
CopyFile(SourceFile="layers/fws-precip-stations-3hour-event-config.json",DestinationFile="${MapFolder}/layers/fws-precip-stations-3hour-event-config.json")
CopyFile(SourceFile="layers/fws-precip-stations-1day-event-config.json",DestinationFile="${MapFolder}/layers/fws-precip-stations-1day-event-config.json")
CopyFile(SourceFile="layers/fws-precip-stations-7day-event-config.json",DestinationFile="${MapFolder}/layers/fws-precip-stations-7day-event-config.json")
CopyFile(SourceFile="layers/fws-precip-stations-classify-1day.csv",DestinationFile="${MapFolder}/layers/fws-precip-stations-classify-1day.csv")
CopyFile(SourceFile="layers/fws-precip-stations-classify-7day.csv",DestinationFile="${MapFolder}/layers/fws-precip-stations-classify-7day.csv")
CopyFile(SourceFile="layers/fws-precip-stations-classify-3hour.csv",DestinationFile="${MapFolder}/layers/fws-precip-stations-classify-3hour.csv")
CopyFile(SourceFile="layers/fws-level-stations.md",DestinationFile="${MapFolder}/layers/fws-level-stations.md")
CopyFile(SourceFile="layers/fws-level-stations-classify.csv",DestinationFile="${MapFolder}/layers/fws-level-stations-classify.csv")
CopyFile(SourceFile="layers/fws-level-stations-event-config.json",DestinationFile="${MapFolder}/layers/fws-level-stations-event-config.json")
#
# SNOTEL stations.
/*
#  CopyFile(SourceFile="layers/snotel-stations.md",DestinationFile="${MapFolder}/layers/snotel-stations.md")
#  CopyFile(SourceFile="layers/snotel-stations-event-config.json",DestinationFile="${MapFolder}/layers/snotel-stations-event-config.json")
*/
# Stream reaches.
#CopyFile(SourceFile="../../BasinEntities/Physical-StreamReaches/layers/stream-reaches.md",DestinationFile="${MapFolder}/layers/stream-reaches.md")
#CopyFile(SourceFile="layers/stream-reaches-event-config.json",DestinationFile="${MapFolder}/layers/stream-reaches-event-config.json")
/*
#  # Cameron Peak burn severity.
#  CopyFile(SourceFile="layers/cameron-peak-sbs.tif",DestinationFile="${MapFolder}/layers/cameron-peak-sbs.tif")
#  CopyFile(SourceFile="layers/cameron-peak-sbs-classify-gridcode.csv",DestinationFile="${MapFolder}/layers/cameron-peak-sbs-classify-gridcode.csv")
#  CopyFile(SourceFile="layers/cameron-peak-sbs.md",DestinationFile="${MapFolder}/layers/cameron-peak-sbs.md")
#  CopyFile(SourceFile="layers/cameron-peak-sbs-event-config.json",DestinationFile="${MapFolder}/layers/cameron-peak-sbs-event-config.json")
#  CopyFile(SourceFile="layers/cameron-peak-sbs-raster-event-config.json",DestinationFile="${MapFolder}/layers/cameron-peak-sbs-raster-event-config.json")
#  # East Troublesome burn severity.
#  CopyFile(SourceFile="layers/east-troublesome-sbs.tif",DestinationFile="${MapFolder}/layers/east-troublesome-sbs.tif")
#  CopyFile(SourceFile="layers/east-troublesome-sbs-classify-gridcode.csv",DestinationFile="${MapFolder}/layers/east-troublesome-sbs-classify-gridcode.csv")
#  CopyFile(SourceFile="layers/east-troublesome-sbs.md",DestinationFile="${MapFolder}/layers/east-troublesome-sbs.md")
#  CopyFile(SourceFile="layers/east-troublesome-sbs-raster-event-config.json",DestinationFile="${MapFolder}/layers/east-troublesome-sbs-raster-event-config.json")
#  # Wildfire perimeters.
#  # - no need to copy layer because read from URL
#  #CopyFile(SourceFile="layers/wildfire-perimeters-classify-wildfire-perimeters.csv",DestinationFile="${MapFolder}/layers/wildfire-perimeters-classify-wildfire-perimeters.csv")
#  CopyFile(SourceFile="layers/wildfire-perimeters.md",DestinationFile="${MapFolder}/layers/wildfire-perimeters.md")
#  CopyFile(SourceFile="layers/wildfire-perimeters-archive.md",DestinationFile="${MapFolder}/layers/wildfire-perimeters-archive.md")
#  CopyFile(SourceFile="layers/wildfire-perimeters-event-config.json",DestinationFile="${MapFolder}/layers/wildfire-perimeters-event-config.json")
#  CopyFile(SourceFile="layers/wildfire-perimeters-archive-event-config.json",DestinationFile="${MapFolder}/layers/wildfire-perimeters-archive-event-config.json")
*/
# RMNP boundary:
# - no need to copy layer because read from URL and local configuration files are with supporting data
#  CopyFile(SourceFile="national-parks-group.md",DestinationFile="${MapFolder}/national-parks-group.md")
#  CopyFile(SourceFile="layers/national-parks-rmnp.md",DestinationFile="${MapFolder}/layers/national-parks-rmnp.md")
#  CopyFile(SourceFile="layers/national-parks-rmnp-event-config.json",DestinationFile="${MapFolder}/layers/national-parks-rmnp-event-config.json")
# Water district 4:
# - no need to copy layer because can use files from the other map
# CopyFile(SourceFile="layers/co-dwr-water-district-4.md",DestinationFile="${MapFolder}/layers/co-dwr-water-district-4.md")
# CopyFile(SourceFile="layers/co-dwr-water-district-4-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-district-4-classify-district.csv")
# CopyFile(SourceFile="../../BasinEntities/Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4.md",DestinationFile="${MapFolder}/layers/co-dwr-water-district-4.md")
# Continental divide:
# - no need to copy layer because read from URL
#CopyFile(SourceFile="layers/continental-divide-co-event-config.json",DestinationFile="${MapFolder}/layers/continental-divide-co-event-config.json")
/*
#  # SNODAS snowpack.
#  # - no need to copy layer because read from URL
#  CopyFile(SourceFile="layers/snodas.md",DestinationFile="${MapFolder}/layers/snodas.md")
#  CopyFile(SourceFile="layers/snodas-event-config.json",DestinationFile="${MapFolder}/layers/snodas-event-config.json")
#  CopyFile(SourceFile="layers/snodas-classify-swe-in.csv",DestinationFile="${MapFolder}/layers/snodas-classify-swe-in.csv")
*/
