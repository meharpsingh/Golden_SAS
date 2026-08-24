ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=5in
  imagename="Fig4-17_Panel_TwoCatVarsOneRespVar_HeadersBorders";
title justify=center 'Sales and Profit Product Line and Totals';
proc sgpanel data=sasuser.OR_SalesProfitByProdLineAndTotal
  noautolegend;
styleattrs datacolors=(Green Blue);
