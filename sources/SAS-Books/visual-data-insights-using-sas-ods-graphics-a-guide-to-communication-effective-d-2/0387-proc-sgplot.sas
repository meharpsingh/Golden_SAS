ods region x=2.5in y=0.5in width=2.5in height=2.0in;
title justify=center 'Average Height By Age';
proc sgplot data=sashelp.class(where=(name =: 'J')) noborder;
vbar age / response=height stat=mean datalabel
  displaybaseline=off
  barwidth=0.5 nooutline fillattrs=(color=green);
yaxis display=none;
xaxis display=(noline noticks nolabel);
format height 2.;
run;
