data iris;
set sashelp.iris;
ratio=SepalLength/SepalWidth;
run;
proc print data= iris (obs=5);
run;
