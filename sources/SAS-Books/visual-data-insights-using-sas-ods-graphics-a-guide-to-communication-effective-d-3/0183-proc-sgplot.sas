proc sgplot data=sashelp.stocks noborder;
where year(Date) EQ 1998 and Stock EQ 'IBM';
step x=Date y=Close;
xaxis display=(noline noticks nolabel) type=discrete;
yaxis display=(noline noticks nolabel);
format Date monname3. Close 3.;
run;
