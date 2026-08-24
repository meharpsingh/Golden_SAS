proc summary data=sashelp.shoes nway;
class Subsidiary;
var Sales;
output out=work.Summary sum=;
run;
proc sort data=work.Summary out=work.Sorted;
by descending Sales;
run;
