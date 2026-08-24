proc summary data=sashelp.shoes nway;
class Region;
var Sales;
output out=work.AllTotalsToSort sum=Sales;
run;
proc sort data=work.AllTotalsToSort out=work.AllTotalsToPrep;
by descending Sales;
run;
