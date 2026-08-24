proc sgplot data=sashelp.stocks noborder;
where year(Date) EQ 1998 and Stock EQ 'IBM';
vbar Date / response=Close datalabel
  displaybaseline=off /* default is a baseline, which
appears even
                         when there is no X axis line. */
  barwidth=0.6 nooutline;
yaxis display=none;
xaxis display=(noline noticks nolabel);
