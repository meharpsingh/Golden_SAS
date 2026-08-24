proc sql noprint;
select sum(count) into :Total
  from sashelp.failure;
quit;
data work.ToChart; /* add a Total observation */
set sashelp.failure end=lastone;
output;
if lastone;
cause='Total';
count = &Total;
output;
run;
ods listing style=listing gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=3in
  imagename="Fig4-30_RankedVbarChartWithDataLabelsAndTotalBar";
title "Ranked Failure Count By Cause and Total";
proc sgplot data=work.ToChart noborder;
vbar cause / displaybaseline=off nooutline fillattrs=(color=Red)
  response=count
  categoryorder=respdesc
  datalabel datalabelattrs=(family=Arial size=8pt weight=Bold);
xaxis display=(nolabel noline noticks) fitpolicy=stagger
  valueattrs=(family=Arial size=8pt weight=Bold);
yaxis display=none;
run;
