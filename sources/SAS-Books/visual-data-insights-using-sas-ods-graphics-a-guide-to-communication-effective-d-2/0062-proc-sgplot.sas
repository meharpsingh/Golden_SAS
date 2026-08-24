proc sgplot data=sashelp.shoes noborder;
vbar Product / response=Sales
  categoryorder=respdesc
  displaybaseline=off nooutline barwidth=0.8
  datalabel datalabelattrs=(family=Arial size=7pt weight=bold)
datalabelpos=bottom
;
xaxis display=(noticks noline nolabel)
  valueattrs=(family=Arial size=7pt weight=bold)
  splitchar=' ' /* so that the values can fit */
  fitpolicy=splitalways;
yaxis display=none;
format Sales dollar11.;
run;
