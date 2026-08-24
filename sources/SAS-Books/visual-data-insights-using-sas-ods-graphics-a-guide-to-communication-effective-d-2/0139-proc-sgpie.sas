ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=
300
;
ods graphics / reset=all scale=off width=
5.7
in height=
4.3
in
  imagename=
  'Fig5-17_DonutOutsideCatRespPct_HoleInfo_InformativeOTHER';
title1 'Shoe Sales and Percent Share By Product';
title2 color=white 'INVISIBLE Text to create white space';
proc sgpie data=sashelp.shoes;
styleattrs datacolors=(
BLACK PURPLE CX3333FF CX00FFFF CX00FF00 ORANGE CXFFCC66 CXFFFF00);
