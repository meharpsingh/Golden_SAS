ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=2.5in
  imagename="Fig4-
10_OneCatTwoMeasures_HBarsSideBySide_DataLabels";
title font='Arial/Bold' height=11pt justify=center
  color=Blue  'Sales' color=Black ' and '
  color=Green 'Profit' color=Black ' by Product Line';
proc sgplot data=sashelp.orsales noborder noautolegend;
hbar Product_Line / response=Total_Retail_Price stat=sum
  displaybaseline=off nooutline fillattrs=(color=Blue)
  barwidth=0.3 discreteoffset=-0.2
  datalabel datalabelattrs=(color=Blue)
  datalabelfitpolicy=none;
hbar Product_Line / response=Profit stat=sum
  displaybaseline=off nooutline fillattrs=(color=Green)
  barwidth=0.3 discreteoffset=+0.2
  datalabel datalabelattrs=(color=Green)
  datalabelfitpolicy=none;
/* YAXISTABLE statements removed */
yaxis display=(nolabel noline noticks) fitpolicy=none;
xaxis display=none;
format Total_Retail_Price dollar12. Profit dollar11.;
run;
