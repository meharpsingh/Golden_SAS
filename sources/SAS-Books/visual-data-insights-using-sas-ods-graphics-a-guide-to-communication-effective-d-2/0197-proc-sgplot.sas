ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=3in
  imagename="Fig8-11_VbarCloseWithDataLabelsForYvalues";
title1 justify=center
'Close Price for IBM Shares on First Trading Day Each Month - 1998';
title2 color=white 'White Space';
proc sgplot data=sashelp.stocks noborder;
where year(Date) EQ 1998 and Stock EQ 'IBM';
vbar Date / response=Close datalabel
displaybaseline=off /* default is a baseline, which appears even
when there is no X axis line. */
  barwidth=0.6 nooutline;
yaxis display=none;
xaxis display=(noline noticks nolabel);
