%let RowAxisOffSetMin = 0;
%let RowAxisOffSetMax = 0.35; /* prevent misleading bar
lengths */
ods listing style=GraphFontArial8ptBold gpath="C:\temp"
dpi=300;
ods graphics on / reset=all scale=off width=2.8in
  imagename="Fig9-
20_RowLatticeVBars_DataLabels_UserAxisOffSets";
title1 justify=center "Average Vehicle Price By Origin and
Type";
proc sgpanel data=sashelp.cars;
panelby Type / layout=rowlattice
  rowheaderpos=left /* text is easier to read at the left
*/
  onepanel novarname noheaderborder spacing=3;
vbar Origin / response=MSRP stat=mean displaybaseline=off
  nooutline barwidth=0.6 fillattrs=(color=blue) datalabel;
rowaxis display=(noticks nolabel noline novalues)
  offsetmin=&RowAxisOffSetMin offsetmax=&RowAxisOffSetMax;
colaxis display=(noticks nolabel noline noticks);
run;
