proc summary data=sashelp.orsales;
class Product_Line;
var Profit Total_Retail_Price;
output out=work.ORsalesSummary sum=;
run;
