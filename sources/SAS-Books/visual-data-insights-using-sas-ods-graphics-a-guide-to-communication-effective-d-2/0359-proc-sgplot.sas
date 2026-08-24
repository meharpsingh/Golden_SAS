ods region column=2;
title justify=center 'Average Weight By Age';;
proc sgplot data=sashelp.class(where=(name =: 'J')) noborder
  description=' ';
vbar age / response=weight stat=mean datalabel displaybaseline=off
  barwidth=0.5 nooutline fillattrs=(color=green);
yaxis display=none;
xaxis display=(noline noticks nolabel);
format weight 3.;
run;
