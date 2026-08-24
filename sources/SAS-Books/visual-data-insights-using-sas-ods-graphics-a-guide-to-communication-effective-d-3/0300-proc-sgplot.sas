ods listing style=GraphFontArial11ptBold
gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
height=2in
  imagename=
  "Fig12-
5_BasicBoxPlotByCategory_WithOutliersButUnlabeled";
title1
'Distribution of Height (inches) By Sex in
SASHELP.HEART Data Set';
proc sgplot data=sashelp.heart noborder;
where Height NE .;
