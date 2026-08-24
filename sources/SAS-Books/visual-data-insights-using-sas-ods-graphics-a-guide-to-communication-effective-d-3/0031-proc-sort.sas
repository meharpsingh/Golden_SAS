proc sort data=sasuser.CityTotals out=work.ToChart;
by Subsidiary;
run;
ods listing style=GraphFontArial8ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=6.5in
  imagename="Fig4-6_AlphaOrderBarChart_CategoryValuePercentRank";
title justify=center "By City Shoe Sales, Percent, and Rank";
proc sgplot data=work.ToChart noborder;
hbar Subsidiary / response=Sales
  fillattrs=(color=CX009900) barwidth=0.5 nooutline
  displaybaseline=off;
yaxistable Sales / position=left location=inside label='Sales';
yaxistable Sales / stat=percent
                   position=left location=inside label='Share';
yaxistable Rank  / location=inside position=left label='Rank';
yaxis display=(nolabel noline noticks) fitpolicy=none;
xaxis display=none;
run;
