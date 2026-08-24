ods listing gpath="C:\temp" dpi=300
style=GraphFontArial6ptBold;
ods graphics / reset=all scale=off width=2.8in
height=2.8in
  imagename="Fig6-
1_LeftSide_HeatMapForMean_13Xby12YwithGrid";
title1 justify=center "Average Diastolic Blood Pressure
(BP)";
title2 justify=center "By Weight (pounds) and Height
(inches)";
title3 justify=center "In 12 Weight Bins and 13 Height
Bins";
proc sgplot data=sashelp.heart;
where height NE . AND weight NE . AND Diastolic NE .;
