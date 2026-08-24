ods listing style=GraphFontArial10ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename="Fig8-20_HighLowLabels_CloseLabels_AxisTableForOpen";
title1 justify=center color=red 'Open' color=black ', ' color=blue
  'Close' color=black ', High, and Low Prices for IBM Shares';
title2 justify=center
  'On the First Trading Day of Each Month in 1998';
proc sgplot data=sashelp.Stocks noautolegend noborder;
where year(Date) EQ 1998 and Stock EQ 'IBM';
highlow x=Date high=high low=low / highlabel=high lowlabel=low
lineattrs=(color=LightGray);
series x=Date y=Close /
datalabel datalabelattrs=(color=blue) datalabelpos=center
lineattrs=(color=white);
xaxistable Open / label='Open' location=inside title=''
labelattrs=(color=red) Valueattrs=(color=red);
yaxis display=none;
xaxis display=(noline noticks nolabel) type=discrete;
format Date monname3. High Low Open Close 3.;
run;
