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
