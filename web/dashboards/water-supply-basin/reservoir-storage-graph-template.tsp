# Set as template so that properties will be automatically expanded.
#@template

[Product]

ProductType = "Graph"
TotalWidth = "600"
TotalHeight = "400"

[SubProduct 1]

GraphType = "AreaStacked"
#GraphType = "Area"
MainTitleString = "${HUC} (Cache la Poudre) Reservoir Storage"
SubTitleString = "Storage total for important water supply reservoirs"
LeftYAxisLabelPrecision = "0"
RightYAxisGraphType = "None"
RightYAxisIgnoreUnits = "false"
LayoutYPercent = ""

[Data 1.1]

TSID = "CO-06016030.BOR.RESC.Day"
TSAlias = "CO-06016030-RESC-Day"
FlaggedDataSymbolStyle = ""
Color = "Red"
LineWidth = "0"

[Data 1.2]

TSID = "CO-06016050.BOR.RESC.Day"
TSAlias = "CO-06016050-RESC-Day"
Color = "Blue"

[Data 1.3]

TSID = "CO-06016070.BOR.RESC.Day"
TSAlias = "CO-06016070-RESC-Day"
Color = "Green"

[Data 1.4]

TSID = "CO-06016090.BOR.RESC.Day"
TSAlias = "CO-06016090-RESC-Day"
Color = "Cyan"

[Data 1.5]

TSID = "CO-06016120.BOR.RESC.Day"
TSAlias = "CO-06016120-RESC-Day"
Color = "Magenta"

[Data 1.6]

TSID = "CO-06016150.BOR.RESC.Day"
TSAlias = "CO-06016150-RESC-Day"
Color = "DarkGray"
FlaggedDataSymbolStyle = ""
LineWidth = "0"

[Data 1.7]

TSID = "CO-06016310.BOR.RESC.Day"
TSAlias = "CO-06016310-RESC-Day"
Color = "Orange"
FlaggedDataSymbolStyle = ""
LineWidth = "0"
