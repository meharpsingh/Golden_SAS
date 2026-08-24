proc summary data=sashelp.shoes nway;
class product;
var Sales;
output out=work.ToChart sum=;
run;
proc sort data=work.ToChart;
by descending Sales;
run;
data work.ToChart;
length SalesDollars $ 5;
set work.ToChart;
SalesDollars = put(Sales / 1000000,dollar5.2);
run;
ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=2.5in
  imagename=
  "Fig4-49_NeedlesAndTextChart_SparserVbarChartAlternative";
title 'Ranked Shoe Sales ($M) By Product';
proc sgplot data=work.ToChart noborder noautolegend;
text x=Product y=Sales text=SalesDollars / position=top;
text x=Product y=Sales text=Product      / position=bottom
  splitpolicy=splitalways splitwidth=7
  splitchar=' ' splitjustify=center;
needle x=Product y=Sales / displaybaseline=off
  transparency=0.9;
xaxis display=none; yaxis display=none; /* no axes needed */
run;
