ods region column=2;
title justify=center 'Student Information';
proc print data=sashelp.class(where=(name =: 'J')) noobs;
var name height weight;
run;
