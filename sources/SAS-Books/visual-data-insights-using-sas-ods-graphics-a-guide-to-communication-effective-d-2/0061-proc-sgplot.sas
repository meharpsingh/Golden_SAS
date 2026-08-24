ods listing style=listing gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
height=2in
  imagename="
Fig4-28_RankedVbarChartWithDataLabels
";
title justify=center "Ranked Shoe Sales by Product";
proc sgplot data=sashelp.shoes noborder;
vbar Product / response=Sales
categoryorder=respdesc
displaybaseline=off nooutline barwidth=0.8
datalabel datalabelattrs=(family=Arial size=7pt weight=bold);
xaxis display=(noticks noline nolabel)
valueattrs=(family=Arial size=7pt weight=bold)
splitchar=' ' /* so that the values can fit */
fitpolicy=splitalways;
yaxis display=none;
format Sales dollar11.;
run;
