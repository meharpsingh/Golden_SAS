proc summary data=sashelp.shoes;
class product subsidiary;
var Sales;
output out=work.ToChart sum=;
run;
ods listing style=GraphFontArial7ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=3in
  imagename="Fig4-37_VbarChartVlineChartOverLay";
title height=10pt
  "Shoes Sales By Product and Number of Cities Where Sold";
proc sgplot data=work.ToChart(where=(_type_ EQ 2))
  noborder noautolegend;
vbar Product / response=Sales
  displaybaseline=off nooutline barwidth=0.8
  datalabel;
