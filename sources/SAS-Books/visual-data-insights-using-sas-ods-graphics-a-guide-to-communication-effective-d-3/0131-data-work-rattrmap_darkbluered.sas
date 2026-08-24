data work.RattrMap_DarkBlueRed;
retain id "RangeID";
length min max $ 2
  color altcolor colormodel1 colormodel2 $ 18;
input id $ min $ max $
  color $ altcolor $ colormodel1 $ colormodel2 $;
  /* INPUT statement ignores everything after second
color */
datalines;
RangeID 1  12 . . CX0000CC CXCCCCFF DarkBlue to Very
Light Blue
RangeID 12 46 . . CXFFCCCC CXFF0000 Very Light Red to
Red
;
run;
ods listing gpath="C:\temp" dpi=300
style=GraphFontArial8ptBold;
ods graphics / reset=all scale=off width=5.7in
height=2.8in
  imagename="Fig6-
10_AnnoHeatMap_MPGasCharacterData_Sorted";
