data work.ToChart;
set sashelp.stocks;
if Stock EQ 'IBM' then IBM = Close;
else if Stock EQ 'Intel' then Intel = Close;
else Microsoft = Close;
run;
ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=3in
  imagename="Fig4-38_VbarChart3BarsOverlayForTimeSeries";
title "Monthly Close for Three Stocks in 2000";
proc sgplot data=work.ToChart(where=(year(Date) EQ 2000)) noborder;
styleattrs datacolors=(Blue Red Gray);
vbar Date / response=IBM
discreteoffset=-0.3
  displaybaseline=off nooutline
barwidth=0.3
  datalabel datalabelattrs=(family=Arial size=5pt weight=bold);
vbar Date / response=Intel
  displaybaseline=off nooutline
barwidth=0.3
  datalabel datalabelattrs=(family=Arial size=5pt weight=bold);
vbar Date / response=Microsoft
discreteoffset=+0.3
  displaybaseline=off nooutline
barwidth=0.3
  datalabel datalabelattrs=(family=Arial size=5pt weight=bold);
xaxis display=(noticks noline nolabel);
yaxis display=none;
keylegend / title=' ' noborder autooutline
  fillheight=11pt fillaspect=golden;
format IBM Intel Microsoft 3. Date monname3.;
label IBM='IBM' Intel='Intel' Microsoft='Microsoft';
run;
