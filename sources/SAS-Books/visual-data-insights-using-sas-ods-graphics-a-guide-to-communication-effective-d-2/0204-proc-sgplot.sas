ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename="Fig8-18_HighLowOpenClose_LabelsAndAxisTables";
title1 justify=center color=red 'Open' color=black ', ' color=blue
'Close' color=black ', High, and Low Prices for IBM Shares';
title2 justify=center 'On First Trading Day of Each Month - 1998';
proc sgplot data=sashelp.Stocks noautolegend noborder;
where year(Date) EQ 1998 and Stock EQ 'IBM';
highlow x=Date high=high low=low /
highlabel=high lowlabel=low open=open close=close;
xaxistable Open  / label='Open'  location=inside title=''
labelattrs=(color=red) valueattrs=(color=red);
xaxistable Close / label='Close' location=inside title=''
labelattrs=(color=blue) valueattrs=(color=blue);
yaxis display=none;
xaxis display=(noline noticks nolabel) type=discrete;
format Date monname3. High Low Open Close 3.;
run;
