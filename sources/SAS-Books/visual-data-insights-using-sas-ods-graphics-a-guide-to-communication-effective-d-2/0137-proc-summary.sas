proc summary data=sashelp.shoes;
class Product;
var Sales;
output out=work.FromSUMMARY sum=;
run;
