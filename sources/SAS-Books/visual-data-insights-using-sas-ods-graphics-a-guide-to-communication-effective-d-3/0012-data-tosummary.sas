data ToSummary;
set sashelp.class;
IntegerHeight = put(height,2.);
run;
proc summary data=ToSummary nway;
class IntegerHeight;
var weight;
output out=ToPlot mean=MeanWgt;
run;
ods listing style=listing gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename=
  "Fig3-
9_Scatter_Plot_ColorCoded_DropLines_and_Xaxistable";
title font='Arial/Bold' height=11pt justify=center
   color=red "Average Weight (pounds) "
   color=black "VS "
   color=blue "Integer Height (inches)";
proc sgplot data=ToPlot noborder;
scatter y=MeanWgt x=IntegerHeight /
  markerattrs=(symbol=circlefilled size=9pt color=red);
dropline x=IntegerHeight y=MeanWgt / dropto=x lineattrs=
(color=red);
yaxis display=none;
xaxistable MeanWgt /
  location=inside
  position=bottom
  title=' '
  label='Avg Wgt'
  labelattrs=(family=Arial size=9pt weight=Bold color=red)
  valueattrs=(family=Arial size=9pt weight=Bold color=red);
xaxis
  display=(noline noticks)
  values=(51 to 72 by 1)
  valueattrs=(family=Arial size=9pt weight=Bold color=blue)
  label='Height (Rounded)'
  labelattrs=(family=Arial size=9pt weight=Bold
color=blue);
format MeanWgt 3.;
run;
