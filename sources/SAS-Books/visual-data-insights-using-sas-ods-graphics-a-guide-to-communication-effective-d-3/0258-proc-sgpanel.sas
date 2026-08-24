ods listing style=GraphFontArial11ptBold gpath="C:\temp"
dpi=300;
ods graphics on / reset=all scale=off width=5.7in
height=5.7in
  imagename="Fig9-
30_PanelWithTwoColumnsSquareImage_ScatterPlots";
title1 justify=center
  "Miles Per Gallon (City) Versus HorsePower By Vehicle
Type";
proc sgpanel data=sashelp.cars;
panelby Type / columns=2
  onepanel novarname noheaderborder spacing=5;
scatter x=horsepower y=mpg_city;
rowaxis display=(nolabel noline) grid
  values=(0 to 60 by 10)
  offsetmin=0; /* does not clip any markers */
colaxis display=(nolabel noline) grid
  values=(0 to 500 by 100)
  offsetmin=0; /* does not clip any markers */
format HorsePower 3. mpg_city 2.;
run;
