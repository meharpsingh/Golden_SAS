data work.ToPlot;
set work.Sorted;
Sales = Sales / 1000000;
run;
ods listing style=GraphFontArial9ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=2.5in
  imagename="Fig4-41_RankedNeedlePlot";
title justify=center 'Ranked Shoe Sales ($M) By Product';
proc sgplot data=work.ToPlot noborder;
needle
 x=Product y=Sales / datalabel datalabelpos=top
  markers markerattrs=(color=Blue symbol=CircleFilled size=9pt)
  displaybaseline=off;
xaxis display=(noline noticks nolabel)
  splitchar=' ' fitpolicy=splitalways;
yaxis display=none;
format Sales dollar6.3;
run;
