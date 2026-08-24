ods listing style=GraphFontArial11ptBold gpath="C:\temp"
dpi=300;
ods graphics / reset=all noscale width=5.7in height=4.3in
  imagename=
  'Fig5-10_YellowToPurple_AllLabelsWhite_ElseSameAsFig5-9';
title1 'Count of Non-Hybrid Car Models By Type';
title2 color=white 'INVISIBLE Text to create white space';
proc sgpie data=sashelp.cars;
where Type NE 'Hybrid';
styleattrs datacolors=(blue gray red purple black);
pie type / otherpercent=0
  sliceorder=respdesc direction=counterclockwise
  startangle=90 startpos=edge
  datalabelattrs=(size=8pt color=white)
  datalabeldisplay=(response percent)
  datalabelloc=inside;
keylegend / noborder title=' '
  fillaspect=golden fillheight=11pt;
run;
