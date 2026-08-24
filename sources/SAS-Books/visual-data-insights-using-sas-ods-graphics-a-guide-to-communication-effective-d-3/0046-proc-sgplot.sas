ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=4in
  imagename=
  "Fig4-23_ORsales_ClusteredDotPlot_GroupBySalesProfit";
title justify=center "Sales and Profit By Product Line & Totals";
proc sgplot data=sasuser.OR_SalesProfitByProdLineAndTotal
noborder;
styleattrs datacontrastcolors=(Green Blue);
dot Product_Line / response=Dollars
  group=SalesOrProfit groupdisplay=cluster
  markerattrs=(symbol=CircleFilled size=11pt)
  datalabel;
yaxis display=(nolabel noline noticks);
xaxis display=none;
keylegend / noborder title=' ' fillheight=11pt;
run;
