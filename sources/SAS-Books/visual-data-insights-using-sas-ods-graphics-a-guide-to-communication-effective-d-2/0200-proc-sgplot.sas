proc sgplot data=sashelp.stocks noborder;
where year(Date) EQ 1998 and Stock EQ 'IBM';
needle x=Date y=Close / datalabel displaybaseline=off
datalabelpos=top; /* default is UpperRight */
yaxis display=none;
xaxis display=(noline noticks nolabel)
type=discrete
;
format Date monname3. Close 3.;
run;
