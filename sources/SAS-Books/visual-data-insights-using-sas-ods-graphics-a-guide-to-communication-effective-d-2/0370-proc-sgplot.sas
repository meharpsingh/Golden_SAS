ods graphics on / reset=all scale=off
  width=2.5in height=1.88in noborder;
/* the output format is set to PNG on the ODS PRINTER statement */
ods region x=0in y=0.45in width=2.5in height=1.88in;
/* overlay bottom of first region which is at 0.6in */
title justify=center 'Average Height By Age';
proc sgplot data=sashelp.class(where=(Name =: 'J')) noborder;
vbar age / response=height stat=mean
  displaybaseline=off datalabel
  nooutline fillattrs=(color=green) barwidth=0.5;
yaxis display=none;
xaxis display=(nolabel noline noticks);
format height 2.;
run;
