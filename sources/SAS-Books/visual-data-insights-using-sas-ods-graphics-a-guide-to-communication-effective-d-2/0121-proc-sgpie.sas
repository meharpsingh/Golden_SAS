ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=
300
;
ods graphics / reset=all noscale width=
5.7
in height=
4.3
in
  imagename=
'Fig5-6_RespAndPct_CatLegend_InsideLabels_DefaultSlicing';
title1 'Count of Non-Hybrid Car Models By Type';
title2 color=white 'INVISIBLE Text to create white space';
proc sgpie data=sashelp.cars;
where Type NE 'Hybrid';
styleattrs datacolors=(blue LightGray red purple black);
