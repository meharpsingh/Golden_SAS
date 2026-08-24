proc sgplot data=sashelp.class(where=(sex EQ 'F')) noborder
  description=' ';
vbar age / response=height stat=mean datalabel displaybaseline=off
  barwidth=0.5 nooutline fillattrs=(color=green);
yaxis display=none;
xaxis display=(nolabel noline noticks);
format height 4.1 age 2.;
run;
title 'Male Students';
proc sgplot data=sashelp.class(where=(sex EQ 'M')) noborder
  description=' ';
vbar age / response=height stat=mean datalabel displaybaseline=off
  barwidth=0.5 nooutline fillattrs=(color=green);
yaxis display=none;
xaxis display=(nolabel noline noticks);
format height 4.1 age 2.;
run;
