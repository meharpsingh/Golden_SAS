ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=2.5in
  imagename="Fig4-20_RankedRegionsDotChartDataLabelPosEQleft";
title justify=center 'Ranked Shoe Sales By Region';
proc sgplot data=sashelp.shoes noborder;
dot Region / response=Sales categoryorder=respdesc
  /* all HBAR options removed */
  markerattrs=(color=Green symbol=CircleFilled size=11pt)
  datalabel
  datalabelpos=left; /* left end of the dot line,
