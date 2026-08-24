proc sgplot data=sashelp.stocks noautolegend noborder;
where year(Date) EQ 1998 and Stock EQ 'IBM';
text x=Date y=Open text=Open / position=left
  textattrs=(color=red family='Arial Narrow');
highlow x=Date high=high low=low / highlabel=high
lowlabel=low
    labelattrs=(family='Arial Narrow') lineattrs=
(color=LightGray)
  open=open close=close;
text x=Date y=Close text=Close / position=right
  textattrs=(color=blue family='Arial Narrow');
yaxis display=none;
xaxis display=(noline noticks nolabel) type=discrete;
format Date monname3. High Low Open Close 3.;
run;
