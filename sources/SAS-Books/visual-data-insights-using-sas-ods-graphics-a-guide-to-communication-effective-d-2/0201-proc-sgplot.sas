ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename="Fig8-14_StepPlotCloseWithDefaultsExceptYvarFormat";
title1 justify=center
'Close Price for IBM Shares on First Trading Day Each Month - 1998';
proc sgplot data=sashelp.stocks noborder;
where year(Date) EQ 1998 and Stock EQ 'IBM';
step x=Date y=Close;
xaxis display=(noline noticks nolabel) type=discrete;
yaxis display=(noline noticks nolabel);
format Date monname3. Close 3.;
run;
