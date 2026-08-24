proc sort data=sashelp.class(keep=age height)
           out=ByAgeHeight;
by age descending height;
run;
data ToPlot;
retain LineAndRowNumber 0;
set ByAgeHeight;
by age;
if First.Age
then LineAndRowNumber = 1;
else LineAndRowNumber + 1;
run;
proc summary data=sashelp.class nway;
class age;
var height;
output out=AvgHgt(keep=age AvgHgt) mean=AvgHgt;
run;
data ToPlot;
merge ToPlot AvgHgt;
by age;
run;
footnote;
ods results=off;
ods _all_ close;
ods listing style=listing gpath="C:\temp";
ods graphics on / reset=all scale=off width=5.7in height=5.7in
  imagename=" Fig3-11_XaxisTablesReplacePlotPointDataLabels";
title1 font='Arial/Bold' height=11pt justify=center
  'Height (inches) vs Age (years)';
title2 font='Arial/Bold' height=11pt justify=center
  'With Plot of ' color=red 'Average Height ' color=black 'vs Age';
proc sgplot data=ToPlot
  noborder
  noautolegend;
styleattrs
  datacontrastcolors=(indigo gray blue magenta saddlebrown)
  datacolors=(indigo gray blue magenta saddlebrown);
scatter x=age y=height /
  group=LineAndRowNumber
  markerattrs=(symbol=CircleFilled size=11pt);
series x=age y=AvgHgt / lineattrs=(color=red thickness=2);
yaxis display=(noline noticks)
  label='Height'
  labelpos=top
  labelattrs=(family=Arial size=11pt weight=Bold)
  values=(51 to 72 by 21)
  valueattrs=(family=Arial size=11pt weight=Bold);
xaxis display=(noline noticks)
  label='Age'
  labelpos=left
  labelattrs=(family=Arial size=11pt weight=Bold)
  values=(11 to 16 by 1)
  valueattrs=(family=Arial size=11pt weight=Bold);
xaxistable height /
  class=LineAndRowNumber
  colorgroup=LineAndRowNumber
  location=inside
  position=bottom
  title=''
  nolabel
  valueattrs=(family=Arial size=11pt weight=Bold);
xaxistable height / stat=mean
  location=inside
  position=bottom
  title=''
  label='Avg '
  labelpos=left
  labelattrs=(family=Arial size=11pt weight=Bold color=red)
  valueattrs=(family=Arial size=11pt weight=Bold color=red);
format AvgHgt height 4.1;
run;
ods listing close;
title; footnote;
