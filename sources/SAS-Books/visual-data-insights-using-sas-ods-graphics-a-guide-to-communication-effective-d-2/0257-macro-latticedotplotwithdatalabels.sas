%macro LatticeDotPlotWithDataLabels
(
imagename=,
imageheight=,
data=,
title=,
datalabelformat=,
datalabelpos=,
rowaxisoffsetmin=,
rowaxisoffsetmax=,
colaxisoffsetmin=,
colaxisoffsetmax=);
ods graphics on / reset=all scale=off imagename="&imagename"
  width=5.7in height=&imageheight;
title1 justify=center "&title";
proc sgpanel data=&data;
panelby Type Drivetrain / layout=lattice
rowheaderpos=left /* text is easier to read at the left */
  onepanel novarname noheaderborder spacing=3;
