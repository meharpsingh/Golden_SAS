proc sgpie data=work.MaxSalesProductAndOthers;
styleattrs datacolors=(CX009900 CXEEEEEE);
donut ProductLabel / response=Sales
  sliceorder=respasc
  holelabel="&PctMaxProduct"
  holelabelattrs=(family='Arial Narrow' color=CX009900)
  startangle=90
  datalabelattrs=(color=blue)
  datalabeldisplay=(category)
  datalabelloc=outside;
run;
ods listing close;
title;
