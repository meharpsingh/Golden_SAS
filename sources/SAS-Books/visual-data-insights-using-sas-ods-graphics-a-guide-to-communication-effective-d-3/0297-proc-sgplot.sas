ods listing style=GraphFontArial11ptBold
gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
height=2in
  imagename="Fig12-
1_BasicBoxPlotIncludingOutliersAndDataLabels";
title1
'Distribution of Female Height (inches) in
SASHELP.HEART Data Set';
proc sgplot data=sashelp.heart noborder;
where Sex EQ 'Female' AND Height NE .;
