proc sgpie data=work.MaxSalesCityAndOthers;
styleattrs datacolors=(CX009900 CXEEEEEE);
donut CityLabel / response=Sales
  sliceorder=respasc /* start with the smallest donut bite */
  holelabel="&PctMaxCity"
  holelabelattrs=(family='Arial Narrow' color=CX009900)
  startangle=90  /* accepting the default STARTPOS=CENTER */
  datalabelattrs=(color=blue)
  datalabeldisplay=(category) datalabelloc=outside;
run;
proc sort data=work.Regions;
by descending Sales;
run;
data work.MaxSalesRegionAndOthers;
set work.Regions;
if _N_ EQ 1;
call symput('PctMaxRegion',
  trim(left(put(Sales/&GrandTotalSales,percent7.1))));;
  /* enough width for (NN.N%), where parenthesis is for negative) */
RegionLabel = trim(left(Region)) || ' - ' || trim(left(put(Sales,dollar10.)));
output;
Sales = &GrandTotalSales - Sales;
RegionLabel = 'Other Regions';
output;
stop; run;
