data work.ToChart;
set sashelp.prdsale;
Actual  = Actual  / 1000;
Predict = Predict / 1000;
run;
ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=3.5in
imagename="Fig4-
35_OneCatVarTwoRespVars_VBarsSideBySide_WithLegend";
title "Actual Sales ($K) vs Predicted Sales ($K) by Product";
proc sgplot data=work.ToChart noborder;
styleattrs datacolors=(Green LightGreen);
vbar Product / response=Actual
  discreteoffset=-0.2
  displaybaseline=off nooutline barwidth=0.4
  datalabel;
vbar Product /  response=Predict
  discreteoffset=+0.2
  displaybaseline=off nooutline barwidth=0.4
  datalabel;
xaxis display=(noticks noline nolabel);
yaxis display=none;
keylegend / title=' ' noborder autooutline
  fillheight=11pt fillaspect=golden;
format Actual Predict dollar4.;
run;
