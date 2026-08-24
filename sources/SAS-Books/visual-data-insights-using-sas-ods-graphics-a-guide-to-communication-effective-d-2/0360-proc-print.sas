ods layout end; /* end first grid (two columns) */
ods layout gridded columns=1 column_widths=(440px);
ods region column=1;
title justify=center 'Student Information';
footnote "Data Source: SASHELP.CLASS";
proc print data=sashelp.class(where=(name =: 'J')) noobs;
var name sex age height weight;
run;
