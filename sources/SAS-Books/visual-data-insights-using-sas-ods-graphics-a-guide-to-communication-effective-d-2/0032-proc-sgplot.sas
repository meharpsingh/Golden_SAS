ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=2.5in
  imagename="Fig4-4_Ranked_TwoYaxisTables_CategoryValuePctAdjacent";
title justify=center 'Ranked Shoe Sales By Region';
proc sgplot data=sashelp.shoes noborder;
hbar Region / response=Sales
  stat=sum /* same as default */
  categoryorder=respdesc
  fillattrs=(color=Green)
  displaybaseline=off nooutline barwidth=0.6;;
