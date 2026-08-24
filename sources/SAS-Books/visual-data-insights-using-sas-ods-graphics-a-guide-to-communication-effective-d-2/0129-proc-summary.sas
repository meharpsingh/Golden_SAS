proc summary data=sashelp.shoes;
class Product;
var Sales;
output out=work.Totals sum=;
run;
