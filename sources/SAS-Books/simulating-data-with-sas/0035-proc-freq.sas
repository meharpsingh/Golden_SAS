ods trace on;
ods graphics off;
proc freq data=Sashelp.Class;
tables sex / chisq;
run;
