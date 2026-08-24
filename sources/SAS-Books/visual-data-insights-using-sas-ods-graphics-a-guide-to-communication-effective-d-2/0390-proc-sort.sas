ods results off;
ods _all_ close;
options nocenter; /* THIS CAN PERSIST AFTER THIS CODE HAS RUN */
proc sort data=sashelp.class(keep=Age) out=work.DistinctAges
nodupkey;
by Age;
run;
