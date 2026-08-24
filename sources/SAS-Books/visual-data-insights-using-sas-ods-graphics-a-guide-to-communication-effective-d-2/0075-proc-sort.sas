proc sort data=sashelp.orsales(keep=Year)
out=work.ForAttrMap nodupkey;
by Year;
run;
