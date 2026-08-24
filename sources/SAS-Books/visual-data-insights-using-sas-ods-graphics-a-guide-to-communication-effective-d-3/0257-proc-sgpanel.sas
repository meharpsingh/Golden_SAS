ods listing style=GraphFontArial11ptBold gpath="C:\temp"
dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename=
  "Fig9-
29_PanelWithDefaultRowAndColumnCounts_ScatterPlots";
title1 justify=center "HorsePower Versus Engine Size By
Number of Cylinders";
proc sgpanel data=sashelp.cars;
panelby Cylinders /
  skipemptycells onepanel noheaderborder spacing=10;
scatter x=EngineSize y=HorsePower;
rowaxis display=(nolabel) grid
  values=(0 to 500 by 100) fitpolicy=none
  offsetmin=0 offsetmax=0.05; /* a marker is at y=500 */
colaxis grid minorgrid minorcount=1
  values=(1 to 9 by 1) fitpolicy=stagger
  offsetmin=0 offsetmax=0; /* no markers near boundaries */
format HorsePower 3. EngineSize 4.2 Cylinders 2.;
label EngineSize='Engine Size (liters)';
run;
