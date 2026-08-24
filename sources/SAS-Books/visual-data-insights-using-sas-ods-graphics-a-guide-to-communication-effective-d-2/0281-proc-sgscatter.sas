ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=2.8in
  imagename="Fig10-9_1Yvar2Xvars_Reg_COMPARE";
title1 justify=center
  'MPG (City) vs Vehicle HorsePower & Weight, Linear Regression';
proc sgscatter data=sashelp.cars;
compare y=MPG_City x=(HorsePower Weight) /
reg=(degree=1 lineattrs=(color=red thickness=1px))
  spacing=10 refticks=(values) grid;
run;
