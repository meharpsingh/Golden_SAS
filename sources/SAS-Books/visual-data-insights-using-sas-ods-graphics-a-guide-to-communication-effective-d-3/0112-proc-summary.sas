proc summary data=sashelp.shoes;
class Product;
var Sales;
output out=work.FromSUMMARY sum=;
run;
data _null_; /* Provide the grand total for the hole value
*/
set work.FromSUMMARY;
where _type_ EQ 0;
call symput('GrandTotalSales',trim(left(Sales)));
run;
ods listing style=GraphFontArial11ptBold gpath="C:\temp"
dpi=300;
ods graphics / reset=all scale=off width=5.7in height=4.3in
  imagename=
  'Fig5-
17_DonutOutsideCatRespPct_HoleInfo_InformativeOTHER';
title1 'Shoe Sales and Percent Share By Product';
title2 color=white 'INVISIBLE Text to create white space';
proc sgpie data=sashelp.shoes;
styleattrs datacolors=(
BLACK PURPLE CX3333FF CX00FFFF CX00FF00 ORANGE CXFFCC66
CXFFFF00);
donut Product / response=Sales
  sliceorder=respdesc direction=clockwise
  startangle=90 startpos=edge
  otherpercent=5
  otherlabel='2.6% Sandal & 1.9% Sport Shoe'
  datalabeldisplay=all
  datalabelattrs=(size=9pt)
  datalabelloc=outside
  holelabel='Total'
  holelabelattrs=(family='Arial Narrow' color=CX009900)
  holevalue=&GrandTotalSales
  holevalueattrs=(family='Arial Narrow' color=CX009900);
run;
