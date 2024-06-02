# Set as template so that properties will be automatically expanded.
#@template

[Product]

ProductType = "Graph"
TotalWidth = "600"
TotalHeight = "400"

[SubProduct 1]

GraphType = "Area"
MainTitleString = "${HUC} (Cache la Poudre) Surface Water Supply Index"
SubTitleString = "Reservoir storage + snowpack + streamflow forecast, 4 = abundant supply, -4 = extreme drought"
RightYAxisGraphType = "None"
RightYAxisIgnoreUnits = "false"
LayoutYPercent = ""

[Data 1.1]

TSID = "${HUC}.CODWR.swsi.Month"
TSAlias = "${HUC}-swsi"
Color = "Black"
LineWidth = "1"

[Annotation 1.1]

ShapeType = "Line"
AnnotationID = "Baseline"
Color = "LightGray"
Order = "BehindData"
XAxisSystem = "Percent"
LineStyle = "Solid"
LineWidth = "3"
Points = "0,0,100,0"
