ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=
300
;
title1 'Count of Students By Age (11-16)';
title2 color=white 'INVISIBLE Text to create white space';
ods graphics / reset=all noscale width=
5.7
in height=
4.3
in
  imagename=
  'Fig5-16_DefaultDonutChart_ExceptSlicingAndDataLabelColor';
proc sgpie
data=sashelp.class;
/* No STYLEATTRS. Taking default colors */
donut age
 / otherpercent=
0
  sliceorder=respdesc direction=counterclockwise
  startangle=
0
 startpos=edge
datalabelattrs=(color=white); /* needed for contrast
