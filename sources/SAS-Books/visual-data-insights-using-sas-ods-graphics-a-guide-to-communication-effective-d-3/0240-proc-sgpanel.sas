ods listing style=GraphFontArial7ptBold gpath="C:\temp"
dpi=300;
ods graphics on / reset=all scale=off width=5.7in
height=1.5in
  imagename="Fig9-
16_ColumnLatticeHBars_NoDataLabels_NoUserOffSets";
title1 justify=center
  "Average Vehicle Price ($K) By Origin and Type"
 color=blue " (No Data Labels, No Programmer Axis
OffSets)";
proc sgpanel data=sashelp.cars;
panelby Type / layout=columnlattice
  onepanel novarname noheaderborder spacing=3;
hbar Origin / response=MSRP stat=mean displaybaseline=off
  nooutline barwidth=0.5 fillattrs=(color=blue);
rowaxis display=(noticks nolabel noline) fitpolicy=none;
colaxis display=(nolabel noline) grid minorgrid
minorcount=1
  values=(0 to 80000 by 20000) fitpolicy=stagger
  valuesdisplay=('$0' '$20' '$40' '$60' '$80');
run;
