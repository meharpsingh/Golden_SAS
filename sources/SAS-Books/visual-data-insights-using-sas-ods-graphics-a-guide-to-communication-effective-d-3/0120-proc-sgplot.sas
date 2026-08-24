ods listing gpath="C:\temp" dpi=300
style=GraphFontArial5ptBold;
ods graphics / reset=all scale=off width=2.8in
height=2.8in
  imagename="Fig6-2_HeatMapDefaultLegendNoOutlines";
title1 justify=center "Counts of Car Origin and Type";
proc sgplot data=sashelp.cars;
heatmap x=type y=origin;
