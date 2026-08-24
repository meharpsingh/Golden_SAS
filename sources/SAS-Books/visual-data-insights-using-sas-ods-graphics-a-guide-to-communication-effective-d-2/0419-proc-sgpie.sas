proc sgpie data=work.MaxSalesRegionAndOthers;
styleattrs datacolors=(CX009900 CXEEEEEE);
donut RegionLabel / response=Sales
  sliceorder=respasc
  holelabel="&PctMaxRegion"
  holelabelattrs=(family='Arial Narrow' color=CX009900)
  startangle=90
  datalabelattrs=(color=blue)
  datalabeldisplay=(category)
  datalabelloc=outside;
run;
proc sort data=work.Products;
by descending Sales;
run;
data work.MaxSalesProductAndOthers;
set work.Products;
if _N_ EQ 1;
call symput('PctMaxProduct',
  trim(left(put(Sales/&GrandTotalSales,percent7.1))));
  /* enough width for (NN.N%), where parenthesis is for negative) */
ProductLabel = trim(left(Product)) || ' - ' || trim(left(put(Sales,dollar10.)));
output;
Sales = &GrandTotalSales - Sales;
ProductLabel = 'Other Products';
output;
stop; run;
