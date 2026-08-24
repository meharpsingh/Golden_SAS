ods listing style=GraphFontArial8ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=6.5in
  imagename="Fig4-
5_Ranked_YaxisTablesForRankCategoryValuePercent";
title justify=center "Ranked Shoe Sales By City";
proc sgplot data=sasuser.CityTotals noborder;
  /* Subsidiary is City */
hbar Subsidiary / response=Sales categoryorder=respdesc
  fillattrs=(color=CX009900) barwidth=0.5 nooutline
  displaybaseline=off;
