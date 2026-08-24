ods listing style=GraphFontArial10ptBold gpath="C:\temp" dpi=300;
/* a larger font size would thin the Y axis to three values */
ods graphics on / reset=all scale=off width=5.7in height=2.8in
  imagename="Fig10-10_1Yvar2Xvars_GroupVarUsedForReg_COMPARE";
title1 justify=center
  'MPG (City) vs Vehicle HorsePower & Weight By Origin - Linear Regression';
proc sgscatter data=sashelp.cars
datacontrastcolors=(gray turquoise magenta)
;
