ods listing style=GraphFontArial10ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename=
  "Fig8-19_HighLowOpenClose_HIGHLOWandTEXTstatements_NarrowLabels";
title1 justify=center color=red 'Open' color=black ', ' color=blue
  'Close' color=black ', High, and Low Prices for IBM Shares';
title2 justify=center 'On First Trading Day of Each Month in 1998';
proc sgplot data=sashelp.stocks noautolegend noborder;
where year(Date) EQ 1998 and Stock EQ 'IBM';
text x=Date y=Open text=Open / position=left
textattrs=(color=red family='Arial Narrow');
highlow x=Date high=high low=low / highlabel=high lowlabel=low
labelattrs=(family='Arial Narrow') lineattrs=(color=LightGray)
open=open close=close;
text x=Date y=Close text=Close / position=right
textattrs=(color=blue family='Arial Narrow');
yaxis display=none;
xaxis display=(noline noticks nolabel) type=discrete;
format Date monname3. High Low Open Close 3.;
run;
