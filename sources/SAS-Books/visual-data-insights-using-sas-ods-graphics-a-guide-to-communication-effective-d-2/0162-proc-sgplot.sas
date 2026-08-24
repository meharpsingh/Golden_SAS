proc sgplot data=sashelp.heart;
scatter y=weight x=height /
  markerattrs=(symbol=CircleFilled size=1px);
xaxis display=(noline nolabel noticks) grid
fitpolicy=stagger /* so that X axis values specified can fit */
  values=(51 to 77 by 1);
yaxis display=(noline nolabel noticks) grid
  fitpolicy=none values=(70 to 300 by 10);
run;
