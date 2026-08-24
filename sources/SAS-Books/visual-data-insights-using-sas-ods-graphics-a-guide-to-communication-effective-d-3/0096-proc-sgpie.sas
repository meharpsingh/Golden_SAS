ods listing style=GraphFontArial11ptBold gpath="C:\temp"
dpi=300;
ods graphics / reset=all noscale width=5.7in height=4.3in
  imagename=
  'Fig5-
2_RespAndPct_CatLegend_DefaultLabelsLoc_DefaultColors';
title1 'Count of Non-Hybrid Car Models By Type';
title2 color=white 'INVISIBLE Text to create white space';
proc sgpie data=sashelp.cars;
where Type NE 'Hybrid';
pie type / otherpercent=0
  sliceorder=respdesc direction=counterclockwise
  startangle=90 startpos=edge
  datalabeldisplay=(response percent);
keylegend / noborder title=' ' fillaspect=golden
  fillheight=11pt; /* match the height of the legend values
