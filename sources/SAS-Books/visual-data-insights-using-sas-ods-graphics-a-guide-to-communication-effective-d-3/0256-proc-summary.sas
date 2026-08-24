proc summary data=sasuser.CarsWithMSRPinThousands nway;
class Origin Type Drivetrain;
var MSRP;
output out=work.CarsAvgMSRP_OriginTypeDrivetrain
mean=AvgMSRP;
run;
%let ColAxisOffSets = 0.21;
ods listing style=GraphFontArial7ptBold gpath="C:\temp"
dpi=300;
ods graphics on / reset=all scale=off width=5.7in
imagename="Fig9-
28_LatticeNeedlePlot_DataLabels_UserColAxisOffSets";
title1 justify=center
  "Average Vehicle Price ($K) By Drive Train, Type, and
Origin";
proc sgpanel data=work.CarsAvgMSRP_OriginTypeDrivetrain;
panelby Type Drivetrain / layout=lattice
  rowheaderpos=left /* text is easier to read at the left
*/
  onepanel novarname noheaderborder spacing=3;
