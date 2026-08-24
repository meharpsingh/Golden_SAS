proc summary data=sashelp.shoes nway;
class Product;
var Sales;
output out=work.Summed(drop=_freq_ _type_) sum=;
run;
