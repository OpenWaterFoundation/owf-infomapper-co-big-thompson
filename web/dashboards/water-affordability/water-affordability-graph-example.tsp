[Product]

MainTitleString = "New Single Family Home Water Costs"
ProductType = "Graph"
TotalHeight = "400"
TotalWidth = "600"

[SubProduct 1]

GraphType = "Point"
MainTitleFontSize = "12"
MainTitleString = "Tap Fee (3/4 inch) & Plant Investment Fee"
RightYAxisGraphType = "None"
RightYAxisIgnoreUnits = "false"
LeftYAxisLabelPrecision = "0"
LayoutYPercent = ""

[Data 1.1]

LineWidth = "1"
TSAlias = "SomeProvider-TapFee"
TSID = "SomeProvider...Year"
SymbolSize = "8"

[Data 1.2]

TSAlias = "SomeProvider-PlantInvestmentFee"
TSID = "SomeProvider...Year"
DataLabelFormat = ""
LineWidth = "1"
SymbolSize = "8"

[SubProduct 2]

GraphType = "Point"
MainTitleFontSize = "12"
MainTitleString = "Monthly Water Utility Bill"
RightYAxisGraphType = "None"
RightYAxisIgnoreUnits = "false"
LayoutYPercent = ""

[Data 2.1]

LineWidth = "1"
TSAlias = "SomeProvider-MonthlyUtilityBill"
TSID = "SomeProvider...Year"
LineStyle = "None"
SymbolSize = "8"
SymbolStyle = "Circle-Filled"
