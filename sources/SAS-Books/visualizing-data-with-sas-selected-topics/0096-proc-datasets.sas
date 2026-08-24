ods path sashelp.tmplmst(read);
proc datasets library=sasuser nolist;
delete templat(memtype=itemstor);
run;
