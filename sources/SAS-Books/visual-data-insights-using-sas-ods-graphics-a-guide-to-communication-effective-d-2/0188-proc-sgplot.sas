ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename="Fig8-1_SeriesClose_TwoYaxes_RefLines";
title1 justify=center
'Close Price for IBM Shares on First Trading Day Each Month - 1998';
proc sgplot data=sashelp.stocks noborder
noautolegend; /* because two lines are drawn (one for Y axis,
run;
