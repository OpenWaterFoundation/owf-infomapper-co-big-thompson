# Create a GeoMapProject file for wildfire Perimeters for Colorado:
# - read the previously downloaded layer file
# - filter out counties that intersect the basin
# - output to the web folder for use by the InfoMapper
# - layer view groups are added from 1st drawn (bottom) to last drawn (top)
#
# Define properties to control processing.
# - use relative paths so that the command file is portable
# - AssetsFolder is where map files exist for the InfoMapper tool
SetProperty(PropertyName="AppFolder",PropertyType="str",PropertyValue="../../../web")
SetProperty(PropertyName="MapsFolder",PropertyType="str",PropertyValue="${AppFolder}/data-maps")
SetProperty(PropertyName="MapFolder",PropertyType="str",PropertyValue="${MapsFolder}/CurrentConditions/Environment-Wildfires")
#
# Create a single map project and map for that project.
# - GeoMapProjectID:  WildfiresProject
# - GeoMapID:  CurrentWildfiresMap
CreateGeoMapProject(NewGeoMapProjectID="WildfiresProject",ProjectType="SingleMap",Name="Wildfires",Description="Wildfires",Properties="author:'Open Water Foundation',specificationFlavor:'',specificationVersion:'1.0.0'")
CreateGeoMap(NewGeoMapID="CurrentWildfiresMap",Name="Current Wildfires",Description="Current wildfires",CRS="EPSG:4326",Properties="extentInitial:'ZoomLevel:-105.4,40.43,10',docPath:wildfires-map.md")
AddGeoMapToGeoMapProject(GeoMapProjectID="WildfiresProject",GeoMapID="CurrentWildfiresMap")
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
# SNODAS snowpack:  read layer and add to a layer view group.
# GeoLayerViewGroupID: SnowpackBasinsGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="SnowpackBasinsGroup",Name="Snowpack Basins",Description="Snowpack for basins",InsertPosition="Top")
#
#CopyFile(SourceFile="../WaterSupply-SnowPack/layers/snodas-event-config.json",DestinationFile="layers/snodas-event-config.json")
#
# Use the current GeoJSON file from the SNODAS tools website
# - TODO smalers 2021-04-20 this is old GeoJSON which causes problems for InfoMapper
# - initial workaround is to use the local copy that has been processed into the new format
# - after that attempt, use the file from the data harvester
#ReadGeoLayerFromGeoJSON(InputFile="https://snodas.cdss.state.co.us/app/SnowpackStatisticsByDate/SnowpackStatisticsByDate_LatestDate.geojson",GeoLayerID="SnodasLayer",Name="Snowpack (SNODAS)",Description="Snowpack from SNODAS")
#ReadGeoLayerFromGeoJSON(InputFile="layers/snodas.geojson",GeoLayerID="SnodasLayer",Name="Snowpack (SNODAS)",Description="Snowpack from SNODAS")
ReadGeoLayerFromGeoJSON(InputFile="https://snodas.cdss.state.co.us/app/SnowpackStatisticsByDate/SnowpackStatisticsByDate_LatestDate.geojson",GeoLayerID="SnodasLayer",Name="Snowpack (SNODAS)",Description="Snowpack from SNODAS")
AddGeoLayerViewToGeoMap(GeoLayerID="SnodasLayer",GeoLayerViewID="SnodasLayerView",Name="Snowpack (SNODAS)",Description="Snowpack from SNODAS as basin mean SWE (in)",Properties="docPath:../WaterSupply-Snowpack/layers/snodas.md,selectedInitial:false,refreshInterval:6Hour")
# Use graduated symbol the same as the SNODAS website
SetGeoLayerViewEventHandler(GeoLayerViewID="SnodasLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../WaterSupply-Snowpack/layers/snodas-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="SnodasLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../WaterSupply-Snowpack/layers/snodas-event-config.json")
# The following is for the downloaded GeoJSON
#SetGeoLayerViewGraduatedSymbol(GeoLayerViewID="SnodasLayerView",Name="Colorize SWE",Description="Show SWE using SNODAS tools colors.",ClassificationAttribute="SNODAS_SWE_Mean_in",Properties="classificationFile:../WaterSupply-Snowpack/layers/snodas-classify-swe-in.csv")
# The following is for the downloaded shapefile saved as GeoJSON
SetGeoLayerViewGraduatedSymbol(GeoLayerViewID="SnodasLayerView",Name="Colorize SWE",Description="Show SWE using SNODAS tools colors.",ClassificationAttribute="SWEMean_in",Properties="classificationFile:../WaterSupply-Snowpack/layers/snodas-classify-swe-in.csv")
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
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="NationalParksGroup",Name="National Parks",Description="National parks",Properties="selectedInitial:true,docPath:'national-parks-group.md'",InsertPosition="Top")
#
# Use the GeoJSON dataset
#ReadGeoLayerFromGeoJSON(InputFile="https://services1.arcgis.com/fBc8EJBxQRMcHlei/arcgis/rest/services/ROMO_BND_Boundary_py_NAD83_1/FeatureServer/0/query?geometry=-109.05%2C36.99%2C-102.05%2C41&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelContains&outFields=*&geometryPrecision=5&f=geojson",GeoLayerID="RMNPBoundaryLayer",Name="RMNP Boundary",Description="Rocky Mountain National Parck boundary web service")
ReadGeoLayerFromGeoJSON(InputFile="https://opendata.arcgis.com/datasets/7cb5f22df8c44900a9f6632adb5f96a5_0.geojson",GeoLayerID="RMNPBoundaryLayer",Name="RMNP Boundary",Description="Rocky Mountain National Parck boundary web service")
AddGeoLayerViewToGeoMap(GeoLayerID="RMNPBoundaryLayer",GeoLayerViewID="RMNPBoundaryLayerView",Name="RMNP Boundary",Description="Rocky Mountain National Park boundary from National Park Service",Properties="docPath:layers/national-parks-rmnp.md")
# Use #339933 - dark green
SetGeoLayerViewSingleSymbol(GeoLayerViewID="RMNPBoundaryLayerView",Name="RMNPBoundarySymbol",Description="RMNP boundaries symbol",Properties="color:#339933,fillColor:#339933,fillOpacity:0.3")
SetGeoLayerViewEventHandler(GeoLayerViewID="RMNPBoundaryLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/national-parks-rmnp-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="RMNPBoundaryLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/national-parks-rmnp-event-config.json")
# = = = = = = = = = =
# Fire Protection Districts
# = = = = = = = = = =
# - color is reddish
# GeoLayerViewGroupID: SoilConservationDistrictsGoup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="SoilConservationDistrictsGoup",Name="Fire Protection Districts",Description="Fire protection districts from DOLA.",Properties="selectedInitial: true",InsertPosition="Top")
#
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dola/district-boundaries/latest/co-fire-protection-districts-waterdistrict4.geojson",GeoLayerID="SoilConservationDistrictsLayer",Name="Fire Protection Districts",Description="Fire protection districts from DOLA.")
# Do not show by default because want to focus on municipal water providers.
AddGeoLayerViewToGeoMap(GeoLayerID="SoilConservationDistrictsLayer",GeoLayerViewID="SoilConservationDistrictsLayerView",Name="Fire Protection Districts",Description="Fire protection districts from DOLA",InsertPosition="Top",Properties="docPath:../../BasinEntities/WaterSupply-WaterProviders/layers/fire-protection-districts.md,selectedInitial:false,highlightEnabled:true")
# Color is a brownish orange.
SetGeoLayerViewSingleSymbol(GeoLayerViewID="SoilConservationDistrictsLayerView",Name="Fire Protection Districts",Description="Fire protection districts from DOLA",Properties="color:#cc3300,opacity:1.0,fillColor:#cc3300,fillOpacity:0.3,weight:2")
SetGeoLayerViewEventHandler(GeoLayerViewID="SoilConservationDistrictsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../../BasinEntities/WaterSupply-WaterProviders/layers/fire-protection-districts-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="SoilConservationDistrictsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../../BasinEntities/WaterSupply-WaterProviders/layers/fire-protection-districts-event-config.json")
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
# The following worked until June 17, 2022?
#ReadGeoLayerFromGeoJSON(InputFile="https://services3.arcgis.com/T4QMspbfLg3qTGWY/arcgis/rest/services/Interagency_Fire_Perimeter_History_All_Years_Read_Only/FeatureServer/0/query?where=GIS_ACRES%20%3E%3D%20150%20AND%20FIRE_YEAR%20%3E%3D%202000&geometry=-110.6%2C35.86%2C-102.05%2C42.2&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelContains&outFields=*&geometryPrecision=5&f=geojson",GeoLayerID="WildfirePerimetersArchiveLayer",Name="Historical Wildfire Perimeters",Description="Wildfire perimeters web service")
ReadGeoLayerFromGeoJSON(InputFile="https://services3.arcgis.com/T4QMspbfLg3qTGWY/arcgis/rest/services/InteragencyFirePerimeterHistory_All_Years_View/FeatureServer/0/query?where=GIS_ACRES%20%3E%3D%20150%20AND%20FIRE_YEAR%20%3E%3D%202000&geometry=-110.6%2C35.86%2C-102.05%2C42.2&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelContains&outFields=*&geometryPrecision=5&f=geojson",GeoLayerID="WildfirePerimetersArchiveLayer",Name="Historical Wildfire Perimeters",Description="Wildfire perimeters web service")
AddGeoLayerViewToGeoMap(GeoLayerID="WildfirePerimetersArchiveLayer",GeoLayerViewID="WildfirePerimetersArchiveLayerView",Name="Historical Wildfire Perimeters",Description="Historical wildfire perimeters (acres>= 150, year>=2000) from the National Interagency Fire Center",Properties="docPath:layers/wildfire-perimeters-archive.md",InsertPosition="Top")
# Change from filled polygons to only outlines
#SetGeoLayerViewSingleSymbol(GeoLayerViewID="WildfirePerimetersArchiveLayerView",Name="WildfirePerimetersArchiveSymbol",Description="Wildfire Perimeters archive symbol",Properties="color:#cc9900,fillColor:#cc9900,fillOpacity:0.3")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="WildfirePerimetersArchiveLayerView",Name="WildfirePerimetersArchiveSymbol",Description="Wildfire Perimeters archive symbol",Properties="color:#cc9900,fillColor:#cc9900,fillOpacity:0.2")
# Outlines don't look good
#SetGeoLayerViewSingleSymbol(GeoLayerViewID="WildfirePerimetersArchiveLayerView",Name="WildfirePerimetersArchiveSymbol",Description="Wildfire Perimeters archive symbol",Properties="color:#cc9900,fillColor:#000000,fillOpacity:0.0")
SetGeoLayerViewEventHandler(GeoLayerViewID="WildfirePerimetersArchiveLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/wildfire-perimeters-archive-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="WildfirePerimetersArchiveLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/wildfire-perimeters-archive-event-config.json")
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
    # Stopped working in 2023.
    #ReadGeoLayerFromGeoJSON(InputFile="https://services3.arcgis.com/T4QMspbfLg3qTGWY/arcgis/rest/services/CY_WildlandFire_Perimeters_ToDate/FeatureServer/0/query?geometry=-110.6%2C35.86%2C-102.05%2C42.2&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelContains&outFields=*&geometryPrecision=5&f=geojson",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimeters",Description="Colorado wildfire perimeters web service")
    # Words for 2023.
    ReadGeoLayerFromGeoJSON(InputFile="https://services3.arcgis.com/T4QMspbfLg3qTGWY/ArcGIS/rest/services/WFIGS_Interagency_Perimeters_YearToDate/FeatureServer/0/query?geometry=-110.6%2C35.86%2C-102.05%2C42.2&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelContains&outFields=*&geometryPrecision=5&f=geojson",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimeters",Description="Colorado wildfire perimeters web service")
    #
    # The following uses too many parameters based on the Esri URL-builder, which are difficult for a user to deal with.
    #ReadGeoLayerFromGeoJSON(InputFile="https://services3.arcgis.com/T4QMspbfLg3qTGWY/ArcGIS/rest/services/Public_Wildfire_Perimeters_View/FeatureServer/0/query?where=1%3D1&objectIds=&time=&geometry=-109.05%2C36.99%2C-102.05%2C41&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelContains&resultType=none&distance=0.0&units=esriSRUnit_Meter&returnGeodetic=false&outFields=*&returnGeometry=true&returnCentroid=false&featureEncoding=esriDefault&multipatchOption=xyFootprint&maxAllowableOffset=&geometryPrecision=&outSR=&datumTransformation=&applyVCSProjection=false&returnIdsOnly=false&returnUniqueIdsOnly=false&returnCountOnly=false&returnExtentOnly=false&returnQueryGeometry=false&returnDistinctValues=false&cacheHint=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&having=&resultOffset=&resultRecordCount=&returnZ=false&returnM=false&returnExceededLimitFeatures=true&quantizationParameters=&sqlFormat=none&f=pgeojson&token=",GeoLayerID="WildfirePerimetersLayer",Name="Colorado Wildfire Perimeters",Description="Colorado wildfire perimeters web service")
EndIf(Name="UseGeoJSONFromWFSIf")
AddGeoLayerViewToGeoMap(GeoLayerID="WildfirePerimetersLayer",GeoLayerViewID="WildfirePerimetersLayerView",Name="Current Year Wildfire Perimeters",Description="Current year wildfire perimeters from the National Interagency Fire Center",Properties="docPath:layers/wildfire-perimeters.md,refreshInterval:24Hour",InsertPosition="Top")
# Switch from solid fill to only outline
#SetGeoLayerViewSingleSymbol(GeoLayerViewID="WildfirePerimetersLayerView",Name="WildfirePerimetersSymbol",Description="Wildfire Perimeters symbol",Properties="color:#ff0000,fillColor:#ff0000,fillOpacity:0.3")
SetGeoLayerViewSingleSymbol(GeoLayerViewID="WildfirePerimetersLayerView",Name="WildfirePerimetersSymbol",Description="Wildfire Perimeters symbol",Properties="color:#ff0000,fillColor:#000000,fillOpacity:0.0")
# TODO smalers 2020-08-14 need to classify on area or some other attribute
#SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="WildfirePerimetersLayerView",Name="Colorize wildfire Perimeters",Description="Show each wildfire perimeter the same color",ClassificationAttribute="county",Properties="classificationType:'categorized',classificationFile:'layers/wildfire-perimeters-classify-county.csv'")
# Same event handler configuration, since just limits features
SetGeoLayerViewEventHandler(GeoLayerViewID="WildfirePerimetersLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/wildfire-perimeters-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="WildfirePerimetersLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/wildfire-perimeters-event-config.json")
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
AddGeoLayerViewToGeoMap(GeoLayerID="EastTroublesomeSoilBurnSeverityRasterLayer",GeoLayerViewID="EastTroublesomeSoilBurnSeverityRasterLayerView",Name="East Troublesome Fire Soil Burn Severity (raster)",Description="East Troublesome Fire soil burn severity from USFS BAER",Properties="docPath:layers/east-troublesome-sbs.md",InsertPosition="Top")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="EastTroublesomeSoilBurnSeverityRasterLayerView",Name="Colorize soil burn severity",Description="Symbol for the soil burn severity",ClassificationAttribute="1",Properties="classificationFile:'layers/east-troublesome-sbs-classify-gridcode.csv',rasterResolution:'128'")
SetGeoLayerViewEventHandler(GeoLayerViewID="EastTroublesomeSoilBurnSeverityRasterLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/east-troublesome-sbs-raster-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="EastTroublesomeSoilBurnSeverityRasterLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/east-troublesome-sbs-raster-event-config.json")
# -------------------
# Soil Burn Severity for Cameron Peak (raster):
# GeoLayerViewGroupID: SoilBurnSeverityGroup
# - raster is faster
ReadRasterGeoLayerFromFile(InputFile="https://data.openwaterfoundation.org/country/us/usfs/baer/2020/cameron-peak/cameron-peak-2020-sbs.tif",GeoLayerID="CameronPeakSoilBurnSeverityRasterLayer",Name="Cameron Peak Fire Soil Burn Severity (raster)",Description="Cameron Peak Fire soil burn severity")
AddGeoLayerViewToGeoMap(GeoLayerID="CameronPeakSoilBurnSeverityRasterLayer",GeoLayerViewID="CameronPeakSoilBurnSeverityRasterLayerView",Name="Cameron Peak Fire Soil Burn Severity (raster)",Description="Cameron Peak Fire soil burn severity from USFS BAER",Properties="docPath:layers/cameron-peak-sbs.md",InsertPosition="Top")
SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="CameronPeakSoilBurnSeverityRasterLayerView",Name="Colorize soil burn severity",Description="Symbol for the soil burn severity",ClassificationAttribute="1",Properties="classificationFile:'layers/cameron-peak-sbs-classify-gridcode.csv',rasterResolution:'128'")
SetGeoLayerViewEventHandler(GeoLayerViewID="CameronPeakSoilBurnSeverityRasterLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/cameron-peak-sbs-raster-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="CameronPeakSoilBurnSeverityRasterLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/cameron-peak-sbs-raster-event-config.json")
#
# -------------------
# Soil Burn Severity for Cameron Peak:
# GeoLayerViewGroupID: SoilBurnSeverityGroup
# - polygon vector layer is slow to draw so rely on raster layer
#
SetProperty(PropertyName="IncludeBurnAreaVector",PropertyType="str",PropertyValue="no")
If(Name="IncludeBurnAreaVector",Condition="${IncludeBurnAreaVector} == yes")
    ReadGeoLayerFromGeoJSON(InputFile="layers/cameron-peak-sbs.geojson",GeoLayerID="SoilBurnSeverityLayer",Name="Cameron Peak Fire Soil Burn Severity",Description="Soil burn severity")
    AddGeoLayerViewToGeoMap(GeoLayerID="SoilBurnSeverityLayer",GeoLayerViewID="SoilBurnSeverityLayerView",Name="Cameron Peak Fire Soil Burn Severity",Description="Cameron Peak Fire soil burn severity from USFS BAER",Properties="docPath:layers/cameron-peak-sbs.md",InsertPosition="Top")
    SetGeoLayerViewCategorizedSymbol(GeoLayerViewID="SoilBurnSeverityLayerView",Name="Colorize soil burn severity",Description="Symbol for the soil burn severity",ClassificationAttribute="gridcode",Properties="classificationFile:'layers/cameron-peak-sbs-classify-gridcode.csv'")
    SetGeoLayerViewEventHandler(GeoLayerViewID="SoilBurnSeverityLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:layers/cameron-peak-sbs-event-config.json")
    SetGeoLayerViewEventHandler(GeoLayerViewID="SoilBurnSeverityLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:layers/cameron-peak-sbs-event-config.json")
EndIf(Name="IncludeBurnAreaVector")
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
# = = = = = = = = = =
# Snow stations:  read layer and add to a layer view group.
# GeoLayerViewGroupID: SnowStationsGroup
AddGeoLayerViewGroupToGeoMap(GeoLayerViewGroupID="SnowStationsGroup",Name="Snow Stations",Description="Snow stations",Properties="selectedInitial: true",InsertPosition="Top")
#
#CopyFile(SourceFile="../WaterSupply-Snowpack/layers/snotel-stations.md",DestinationFile="layers/snotel-stations.md")
#CopyFile(SourceFile="../WaterSupply-Snowpack/layers/snotel-stations-event-config.json",DestinationFile="layers/snotel-stations-event-config.json")
ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/country/us/nrcs/snotel/co-snotel-stations.geojson",GeoLayerID="SnotelStationsLayer",Name="SNOTEL Stations",Description="SNOTEL stations from NRCS")
AddGeoLayerViewToGeoMap(GeoLayerID="SnotelStationsLayer",GeoLayerViewID="SnotelStationsLayerView",Name="SNOTEL Stations",Description="SNOTEL stations from NRCS",Properties="docPath:'../WaterSupply-Snowpack/layers/snotel-stations.md'")
# For now use single symbol
# - TODO smalers 2020-05-22 need to enable a graduated symbol based on SWE value
SetGeoLayerViewSingleSymbol(GeoLayerViewID="SnotelStationsLayerView",Name="SNOTEL Stations",Description="SNOTEL stations from NRCS",Properties="symbolShape:Circle,color:black,fillColor:black,symbolSize:4,sizeUnits:pixels,opacity:1.0,fillOpacity:1.0,weight:1.5")
SetGeoLayerViewEventHandler(GeoLayerViewID="SnotelStationsLayerView",EventType="hover",Name="Hover event",Description="Hover event configuration",Properties="eventConfigPath:../WaterSupply-Snowpack/layers/snotel-stations-event-config.json")
SetGeoLayerViewEventHandler(GeoLayerViewID="SnotelStationsLayerView",EventType="click",Name="Click event",Description="Click event configuration",Properties="eventConfigPath:../WaterSupply-Snowpack/layers/snotel-stations-event-config.json")
# = = = = = = = = = =
# Write the map project file and copy layers to the location needed by the web application.
# - follow InfoMapper conventions
WriteGeoMapProjectToJSON(GeoMapProjectID="WildfiresProject",Indent="2",OutputFile="wildfires-map.json")
CreateFolder(Folder="${MapFolder}/layers",CreateParentFolders="True",IfFolderExists="Ignore")
CopyFile(SourceFile="wildfires-map.json",DestinationFile="${MapFolder}/wildfires-map.json")
CopyFile(SourceFile="wildfires-map.md",DestinationFile="${MapFolder}/wildfires-map.md")
# -----
# Layers
# SNOTEL stations.
#CopyFile(SourceFile="layers/snotel-stations.md",DestinationFile="${MapFolder}/layers/snotel-stations.md")
#CopyFile(SourceFile="layers/snotel-stations-event-config.json",DestinationFile="${MapFolder}/layers/snotel-stations-event-config.json")
# Stream reaches.
#CopyFile(SourceFile="../../BasinEntities/Physical-StreamReaches/layers/stream-reaches.md",DestinationFile="${MapFolder}/layers/stream-reaches.md")
#CopyFile(SourceFile="layers/stream-reaches-event-config.json",DestinationFile="${MapFolder}/layers/stream-reaches-event-config.json")
# Cameron Peak burn severity.
CopyFile(SourceFile="layers/cameron-peak-sbs-classify-gridcode.csv",DestinationFile="${MapFolder}/layers/cameron-peak-sbs-classify-gridcode.csv")
CopyFile(SourceFile="layers/cameron-peak-sbs.md",DestinationFile="${MapFolder}/layers/cameron-peak-sbs.md")
CopyFile(SourceFile="layers/cameron-peak-sbs-event-config.json",DestinationFile="${MapFolder}/layers/cameron-peak-sbs-event-config.json")
CopyFile(SourceFile="layers/cameron-peak-sbs-raster-event-config.json",DestinationFile="${MapFolder}/layers/cameron-peak-sbs-raster-event-config.json")
# East Troublesome burn severity.
CopyFile(SourceFile="layers/east-troublesome-sbs-classify-gridcode.csv",DestinationFile="${MapFolder}/layers/east-troublesome-sbs-classify-gridcode.csv")
CopyFile(SourceFile="layers/east-troublesome-sbs.md",DestinationFile="${MapFolder}/layers/east-troublesome-sbs.md")
CopyFile(SourceFile="layers/east-troublesome-sbs-raster-event-config.json",DestinationFile="${MapFolder}/layers/east-troublesome-sbs-raster-event-config.json")
# Wildfire perimeters.
# - no need to copy layer because read from URL
#CopyFile(SourceFile="layers/wildfire-perimeters-classify-wildfire-perimeters.csv",DestinationFile="${MapFolder}/layers/wildfire-perimeters-classify-wildfire-perimeters.csv")
CopyFile(SourceFile="layers/wildfire-perimeters.md",DestinationFile="${MapFolder}/layers/wildfire-perimeters.md")
CopyFile(SourceFile="layers/wildfire-perimeters-archive.md",DestinationFile="${MapFolder}/layers/wildfire-perimeters-archive.md")
CopyFile(SourceFile="layers/wildfire-perimeters-event-config.json",DestinationFile="${MapFolder}/layers/wildfire-perimeters-event-config.json")
CopyFile(SourceFile="layers/wildfire-perimeters-archive-event-config.json",DestinationFile="${MapFolder}/layers/wildfire-perimeters-archive-event-config.json")
# RMNP boundary.
# - no need to copy layer because read from URL
CopyFile(SourceFile="national-parks-group.md",DestinationFile="${MapFolder}/national-parks-group.md")
CopyFile(SourceFile="layers/national-parks-rmnp.md",DestinationFile="${MapFolder}/layers/national-parks-rmnp.md")
CopyFile(SourceFile="layers/national-parks-rmnp-event-config.json",DestinationFile="${MapFolder}/layers/national-parks-rmnp-event-config.json")
# Water district 4.
#CopyFile(SourceFile="layers/co-dwr-water-district-4-classify-district.csv",DestinationFile="${MapFolder}/layers/co-dwr-water-district-4-classify-district.csv")
#CopyFile(SourceFile="../../BasinEntities/Administration-CoDwrWaterDistricts/layers/co-dwr-water-district-4.md",DestinationFile="${MapFolder}/layers/co-dwr-water-district-4.md")
# Continental divide.
# - no need to copy layer because read from URL
#CopyFile(SourceFile="layers/continental-divide-co-event-config.json",DestinationFile="${MapFolder}/layers/continental-divide-co-event-config.json")
#CopyFile(SourceFile="../../SupportingData/Physical-ContinentalDivide/layers/continental-divide.md",DestinationFile="${MapFolder}/layers/continental-divide.md")
# SNODAS snowpack.
# - no need to copy layer because read from URL
#CopyFile(SourceFile="layers/snodas.md",DestinationFile="${MapFolder}/layers/snodas.md")
#CopyFile(SourceFile="layers/snodas-event-config.json",DestinationFile="${MapFolder}/layers/snodas-event-config.json")
#CopyFile(SourceFile="layers/snodas-classify-swe-in.csv",DestinationFile="${MapFolder}/layers/snodas-classify-swe-in.csv")
