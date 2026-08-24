proc summary data=sashelp.shoes;
class product subsidiary;
var Sales;
output out=work.ToChart sum=;
run;
