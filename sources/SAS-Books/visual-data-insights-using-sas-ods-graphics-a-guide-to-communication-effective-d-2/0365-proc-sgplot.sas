ods region x=2.5in y=0.45in width=2.5in height=1.88in;
/* overlay bottom of first region which is at 0.6in */
title justify=center 'Average Weight By Age';
proc sgplot data=sashelp.class(where=(Name =: 'J')) noborder;
vbar age / response=weight stat=mean
  displaybaseline=off datalabel
  nooutline fillattrs=(color=green) barwidth=0.5;
yaxis display=none;
xaxis display=(nolabel noline noticks);
format weight 3.;
run;
