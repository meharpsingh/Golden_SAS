ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=3in
  imagename="Fig12-14_FrequencyDistribution_NearlyDefault";
title
"Frequency Distribution of Female Height in SASHELP.HEART Data Set";
proc sgplot data=work.ToPlot noborder noautolegend;
needle x=Height y=_freq_ / displaybaseline=off
/* without markers, very small frequencies are barely visible */
markers markerattrs=(symbol=SquareFilled color=red size=3px);
xaxis display=(noline noticks nolabel);
yaxis display=(noline noticks nolabel);
run;
