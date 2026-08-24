proc summary data=sashelp.shoes nway;
where Region IN ('Africa' 'Asia' 'Middle East' 'Pacific')
AND  (Product =: "Men's" OR Product =: "Women's");
class Region Product;
var Sales;
output out=work.ToRescale(rename=(_freq_ = CountOfCities)) sum=Sales;
run;
data work.ToChart;
set work.ToRescale;
Sales = Sales / 1000000;
run;
