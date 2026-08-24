ods listing
style=GraphFontArial11ptBold /* using a custom style */
  gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=2.5in
  imagename="Fig4-3_Ranked_CatAndValAdjacent_DataLabelPosEQleft";
title justify=center 'Ranked Shoe Sales By Region';
proc sgplot data=sashelp.shoes noborder;
hbar Region / response=Sales
  stat=sum /* same as default when RESPONSE= is used */
  categoryorder=respdesc
  datalabel
/* DATALABELATTRS now come from custom style */
  datalabelfitpolicy=none
datalabelpos=left /* at the left end of the bar */
  fillattrs=(color=Green)
  barwidth=0.6
  nooutline
  displaybaseline=off;
yaxis display=(nolabel noline noticks) fitpolicy=none;
/* VALUEATTRS now come from custom style */
xaxis display=none;
run;
