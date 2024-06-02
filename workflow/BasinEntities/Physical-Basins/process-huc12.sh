#!/bin/sh

# This script was previously in the downloads folder:
# - TODO smalers 2022-08-02 need to document use

# Process the huc12 list output from QGIS export
# Output should look like:
#    1019000710,#ff6666,1.0,#ff6666,0.3,2,"1019000701, Coalbank Creek-Cache la Poudre River"

grep 10190007 huc12-export.csv | tr -d '"' | awk '{
FS = ","
printf("%s,#ff3399,1.0,#ff3399,0.3,2,\"%s, %s\"\n",$2, $2, $1)
}' | sort > huc12-export-classify.csv
