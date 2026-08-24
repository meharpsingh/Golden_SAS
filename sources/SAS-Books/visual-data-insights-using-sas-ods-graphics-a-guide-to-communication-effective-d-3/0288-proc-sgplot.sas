ods listing style=GraphFontArial11ptBold
gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename="Fig11-
1_CustomScatterPlotwithELLIPSEdefaults";
title1 'Student Weight (pounds) vs Height (inches)';
proc sgplot data=sashelp.class noborder;
scatter x=height y=weight /
  datalabel
  FilledOutlinedMarkers
  markerfillattrs=(color=red)
  markerattrs=(symbol=CircleFilled size=9pt)
  markeroutlineattrs=(color=blue thickness=1px);
