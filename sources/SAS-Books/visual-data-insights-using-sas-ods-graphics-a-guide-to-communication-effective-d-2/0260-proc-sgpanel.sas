%let ColAxisOffSets = 0.24;
ods listing style=GraphFontArial9ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=3in
imagename=
  "Fig9-27_ColumnLatticeNeedlePlot_DataLabels_UserColAxisOffSets";
title1 justify=center
  "Average Vehicle Price ($K) By Origin and Type";
proc sgpanel data=sasuser.CarsAvgMSRPK_byOriginbyType;
panelby Type /
layout=columnlattice
  onepanel novarname noheaderborder spacing=3;
