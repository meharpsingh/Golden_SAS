ods results=off;
ods _all_ close;
ods listing style=GraphFontArial10ptBold gpath="C:\temp" dpi=300;
  /* 11pt font would case aa title line break */
ods graphics on / reset=all scale=off width=2.8in height=2.8in
  imagename="AppendixA10-1_RefTicksEmulationForSGPLOTwithSCATTER";
title1 justify=center 'Weight (lbs.) vs Height (in.) By Sex';
proc sgplot data=sashelp.class noborder;
styleattrs datacontrastcolors=(red blue);
scatter y=weight x=height /
  name='ScatterPlotWithGroupVar'
  group=sex
  markerattrs=(symbol=CircleFilled);
scatter y=weight x=height /
  y2axis x2axis
  markerattrs=(size=0);
yaxis
  display=(noline nolabel)
  values=(50 to 150 by 10)
  fitpolicy=none
  grid;
xaxis
  minor minorcount=2
  display=(noline nolabel)
  values=(51 to 72 by 3)
  fitpolicy=none
  grid minorgrid minorcount=2;
y2axis
  display=(noline nolabel)
  values=(50 to 150 by 10)
  fitpolicy=none;
