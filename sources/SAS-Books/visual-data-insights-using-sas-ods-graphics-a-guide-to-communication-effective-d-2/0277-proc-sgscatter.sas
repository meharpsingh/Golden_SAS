ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename="Fig10-5_MultipleYvars_MultipleXvars_ScatterPlots";
title1 justify=center
  'MPG (City) & MPG (Highway) vs Vehicle HorsePower & Weight';
proc sgscatter data=sashelp.cars;
plot (MPG_City MPG_Highway)*(HorsePower Weight) /
  axisextent=data grid;
run;
