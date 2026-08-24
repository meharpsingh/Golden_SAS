proc summary data=sasuser.CarsWithMSRPinThousands nway;
class Origin Type;
var MSRP;
output out=sasuser.CarsAvgMSRPK_byOriginbyType
mean=AvgMSRP;
/* Data set persists, and is also used for Figure 9-27. */
run;
%let ColAxisOffSets = 0.25;
ods listing style=GraphFontArial9ptBold gpath="C:\temp"
dpi=300;
ods graphics on / reset=all scale=off width=2.8in
  imagename=
  "Fig9-
26_RowLatticeNeedlePlot_DataLabels_UserAxisOffSets";
title1 justify=center "Avg Vehicle Price By Origin and
Type";
proc sgpanel data=sasuser.CarsAvgMSRPK_byOriginbyType;
panelby Type / layout=rowlattice
  rowheaderpos=left /* text is easier to read at the left
*/
  onepanel novarname noheaderborder spacing=3;
