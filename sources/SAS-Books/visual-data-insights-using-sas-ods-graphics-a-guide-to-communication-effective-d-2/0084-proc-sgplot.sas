ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=3in
  imagename="Fig4-45_ORsales_ClusterNeedlePlot_GroupBySalesProfit";
title1 'Sales ($M) and Profit ($M) Product Line & Totals';
proc sgplot data=sasuser.OR_SalesProfitByProdLineAndTotal noborder;
styleattrs datacontrastcolors=(Blue Green);
