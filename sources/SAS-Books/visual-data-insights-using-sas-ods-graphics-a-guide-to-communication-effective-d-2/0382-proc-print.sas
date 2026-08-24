ods region row=2 column=1;
title justify=center 'Weight & Height';
proc print data=sashelp.class(where=(name =: 'J')) noobs;
var name weight height;
run;
