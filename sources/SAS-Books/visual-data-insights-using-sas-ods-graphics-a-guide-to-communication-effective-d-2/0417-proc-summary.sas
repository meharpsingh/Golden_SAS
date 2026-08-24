ods results off;
ods _all_ close;
ods listing style=GraphFontArial6ptBold gpath="C:\temp" dpi=300;
proc summary data=sashelp.shoes;
class Region Subsidiary Product;
var Sales;
output out=work.FromSUMMARY sum=;
run;
data work.Cities work.Regions work.Products;
set work.FromSummary;
if _type_ EQ 0
then call symput('GrandTotalSales',trim(left(Sales)));
else if _type_ EQ 1 then output work.Products;
else if _type_ EQ 2 then output work.Cities;
else if _type_ EQ 4 then output work.Regions;
run;
proc sort data=work.Cities;
by descending Sales; run;
data work.MaxSalesCityAndOthers;
set work.Cities;
if _N_ EQ 1;
call symput('PctMaxCity',
  trim(left(put(Sales/&GrandTotalSales,percent6.1))));
