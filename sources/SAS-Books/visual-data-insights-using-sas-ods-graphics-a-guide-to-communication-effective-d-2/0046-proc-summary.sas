proc summary data=sashelp.orsales;
class Product_Line;
var Profit Total_Retail_Price;
output out=work.ORsalesSummary sum=;
run;
data work.ToChart;
set work.ORsalesSummary;
if _type_ EQ 0 then Product_Line = 'Total';
run;
ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=1.5in
  imagename="
Fig4-13_HbarAndDotPlotOverLaid_YaxisTables
";
title justify=center color=Blue 'Sales' color=Black ' and '
  color=Green 'Profit' color=Black ' by Product Line and Total';
proc sgplot data=work.ToChart noborder noautolegend;
hbar Product_Line / response=Profit
  displaybaseline=off
  nooutline fillattrs=(color=Green) barwidth=0.6;
