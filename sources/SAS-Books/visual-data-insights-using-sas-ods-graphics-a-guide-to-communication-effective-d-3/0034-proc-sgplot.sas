ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=1.75in
  imagename="Fig4-
9_OneCategoryTwoMeasures_HBarsSideBySide_Legend";
title justify=center 'Sales and Profit by Product Line';
proc sgplot data=sashelp.orsales noborder; /* remove NOAUTOLEGEND
