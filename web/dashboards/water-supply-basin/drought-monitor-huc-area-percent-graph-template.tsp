# Indicate that this is a template so that properties will be expanded.
#@template

[Product]

ProductType = "Graph"
TotalWidth = "600"
TotalHeight = "400"

[SubProduct 1]

MainTitleString = "Drought Monitor for HUC Basin ${HUC} (Cache la Poudre)"
SubTitleString = "Percent of basin area at different drought levels, D0 = Abnormally Dry, D4 = Exceptional Drought"
GraphType = "Area"
LeftYAxisLegendPosition = "Left"
LegendFormat = "%T"
LeftYAxisLabelPrecision = "0"
RightYAxisGraphType = "None"
RightYAxisIgnoreUnits = "false"
LayoutYPercent = ""

[Data 1.1]

TSID = "${HUC}.USDM.D0.Day"
TSAlias = "${HUC}-USDM-D0"
FlaggedDataSymbolStyle = ""
Color = "#fffe31"
LineWidth = "0"

[Data 1.2]

TSID = "${HUC}.USDM.D1.Day"
TSAlias = "${HUC}-USDM-D1"
Color = "#fbd283"

[Data 1.3]

TSID = "${HUC}.USDM.D2.Day"
TSAlias = "${HUC}-USDM-D2"
Color = "#fda924"

[Data 1.4]

TSID = "${HUC}.USDM.D3.Day"
TSAlias = "${HUC}-USDM-D3"
Color = "#e40013"

[Data 1.5]

TSID = "${HUC}.USDM.D4.Day"
TSAlias = "${HUC}-USDM-D4"
Color = "#720005"
