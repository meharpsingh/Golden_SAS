proc sgplot data=work.ToPlot noborder noautolegend;
needle x=Height y=_freq_ / displaybaseline=off;
/* let the SCATTER statement for the  Y2 axis draw the markers */
scatter
 x=Height y=_freq_ /
y2axis
  markerattrs=(symbol=SquareFilled color=red size=3px);
xaxis display=(noline nolabel) /* display tick marks */
  values=(51 to 71 by 1);
