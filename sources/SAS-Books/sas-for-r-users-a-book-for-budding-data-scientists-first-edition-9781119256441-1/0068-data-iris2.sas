data iris2;
 set sashelp.iris;
 if _N_ in (2, 6, 8, 10, 34) then output;
 run;
proc print data= iris2 ;
run;
