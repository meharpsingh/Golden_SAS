%include "C:\SharedCode\ExtractEconomicData.sas";
options mprint;
%ExtractEconomicData
(SASETSsiteUseSASHELPDataLib=NO,
OtherSiteFolderForCitiData=C:\CitiData,
OutLib=SASUSER);
ods listing style=GraphFontArial
8pt
Bold gpath="C:\temp" dpi=300;
/* All text is 8pt. */
ods graphics on / reset=all scale=off width=5.7in
  imagename="
Fig11-8_LinearRegressionUsingRealData
";
title1 "Avg Weekly Initial Unemployment Insurance Claims (1000's) vs Unemployment Rate (%)";
title2 'By Month 1980 to 1991';
proc sgplot
data=sasuser.EconomicData
 noborder;
reg
x=LHUR y=LUINC
 / name='reg' nomarkers
lineattrs=(color=LightGray thickness=3px)
  clm clmattrs=(fill clmfillattrs=(color=Yellow)
        outline clmlineattrs=(color=Green thickness=3px))
  Cli cliattrs=(fill clifillattrs=(color=CXFF66FF)
        outline clilineattrs=(color=CX00FFFF thickness=3px))
  degree=1 alpha=.05;
scatter
x=LHUR y=LUINC
 /
/* DATALABEL not used. Points too dense */
  FilledOutlinedMarkers
  markerattrs=(symbol=CircleFilled size=9pt)
  markerfillattrs=(color=LightGray)
  markeroutlineattrs=(color=black thickness=2px);
yaxis
display=(noline noticks nolabel)
;
xaxis display=(noline noticks nolabel);
