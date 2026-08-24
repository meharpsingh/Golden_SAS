ods listing style=GraphFontArial11ptBold gpath="C:\temp"
dpi=300;
ods graphics / reset=all noscale width=5.7in height=4.3in
  imagename='Fig5-1_DefaultLabelsDisplay_DefaultLabelsLoc';
title1 'Count of Non-Hybrid Car Models By Type';
title2 color=white 'INVISIBLE Text to create white space';
  /* white space is added in several examples */
proc sgpie data=sashelp.cars;
where Type NE 'Hybrid';
styleattrs /* datacolors here are pie slice fill colors */
  datacolors=(blue LightGray red purple black);
