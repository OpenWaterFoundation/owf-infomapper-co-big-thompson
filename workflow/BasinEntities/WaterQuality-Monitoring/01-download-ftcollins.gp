# Download Fort Collins water quality monitoring layer.
# - this should only need to be done periodically
# - currently there is no download, received by email from Richard Thorp
#WebGet(URL="https://opendata.fcgov.com/api/geospatial/3j2e-2d5c?method=export&format=GeoJSON",OutputFile="downloads/trails-fortcollins.geojson",Timeout="10")
#
# Unzip the files into a folder
UnzipFile(File="downloads/fortcollins-waterqualitydata.zip",OutputFolder="downloads/ftcollins",IfFolderDoesNotExist="Create")
#
# Read the shapefiles from 'downloads/' and write GeoJSON to 'layers/'
ReadGeoLayerFromShapefile(InputFile="downloads/ftcollins/AOI_Mainstem_above_canyon_mouth.shp",GeoLayerID="MainStemBasinLayer")
WriteGeoLayerToGeoJSON(GeoLayerID="MainStemBasinLayer",OutputFile="layers/wq-monitoring-mainstem-basin.geojson")
#
ReadGeoLayerFromShapefile(InputFile="downloads/ftcollins/NorthForkCLP.shp",GeoLayerID="NorthForkBasinLayer")
WriteGeoLayerToGeoJSON(GeoLayerID="NorthForkBasinLayer",OutputFile="layers/wq-monitoring-northfork-basin.geojson")
#
ReadGeoLayerFromShapefile(InputFile="downloads/ftcollins/MonitoringSites.shp",GeoLayerID="MonitoringSitesLayer")
WriteGeoLayerToGeoJSON(GeoLayerID="MonitoringSitesLayer",OutputFile="layers/wq-monitoring-sites.geojson")