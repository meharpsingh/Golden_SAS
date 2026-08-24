data work.Extract(keep=Height);
set sashelp.heart(where=(Sex EQ 'Female' AND Height NE
.));
run;
proc sql noprint;
select mean(Height),std(Height) into :Mean,:STD from
work.Extract;
quit;
