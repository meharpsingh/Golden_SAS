ods layout gridded columns=2
  column_widths=(210px 210px) column_gutter=20px;
ods graphics on / reset=all scale=off width=210px
  outputfmt=SVG imagemap=on;
ods region column=1;
title justify=center 'Average Height By Age';
proc sgplot data=sashelp.class(where=(name =: 'J')) noborder
  description=' ';
vbar age / response=height stat=mean datalabel
displaybaseline=off
  barwidth=0.5 nooutline fillattrs=(color=green);
yaxis display=none;
xaxis display=(noline noticks nolabel);
format height 2.;
run;
ods region column=2;
title justify=center 'Average Weight By Age';;
proc sgplot data=sashelp.class(where=(name =: 'J')) noborder
  description=' ';
vbar age / response=weight stat=mean datalabel
displaybaseline=off
  barwidth=0.5 nooutline fillattrs=(color=green);
yaxis display=none;
xaxis display=(noline noticks nolabel);
format weight 3.;
run;
ods layout end; /* end first grid (two columns) */
ods layout gridded columns=1 column_widths=(440px);
ods region column=1;
title justify=center 'Student Information';
footnote "Data Source: SASHELP.CLASS";
proc print data=sashelp.class(where=(name =: 'J')) noobs;
var name sex age height weight;
run;
ods layout end; /* end second grid (one column) */
