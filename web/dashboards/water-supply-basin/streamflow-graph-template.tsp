[Product]

ProductType = "Graph"
TotalWidth = "600"
TotalHeight = "400"

[SubProduct 1]

GraphType = "Line"
MainTitleString = "Poudre River Streamflow"
SubTitleString = "Daily average flows and median of historical flows, CLAFTCCO = Mouth of Canyon, CLAFORCO = at Fort Collins"
LeftYAxisLabelPrecision = "0"
RightYAxisGraphType = "None"
RightYAxisIgnoreUnits = "false"

[Data 1.1]

TSID = "abbrev:CLAFTCCO..Streamflow-Avg.Day~HydroBaseWeb"
TSAlias = "CLAFTCCO-Streamflow-Day"
LineWidth = "3"

[Data 1.2]

TSID = "abbrev:CLAFORCO..Streamflow-Avg.Day~HydroBaseWeb"
TSAlias = "CLAFORCO-Streamflow-Day"
LineWidth = "3"

[Data 1.3]

TSID = "abbrev:CLAFTCCO..Streamflow-Avg-Running-Median.Day~HydroBaseWeb"
TSAlias = "CLAFTCCO-Streamflow-Median-Day"
Color = "Red"
LineStyle = "Solid"

[Data 1.4]

TSID = "abbrev:CLAFORCO..Streamflow-Avg-Running-Median.Day~HydroBaseWeb"
TSAlias = "CLAFORCO-Streamflow-Median-Day"
Color = "Blue"
LineStyle = "Solid"
