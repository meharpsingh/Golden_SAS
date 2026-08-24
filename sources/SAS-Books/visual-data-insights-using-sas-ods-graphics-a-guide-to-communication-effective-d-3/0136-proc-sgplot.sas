ods graphics /
  imagename="Fig6-
11_LowerLeft_HeatMap_24YbinsBy26Xbins";
title2 height=8pt 'Heat Map - 24 Y bins and 26 X bins';;
proc sgplot data=sashelp.heart;
heatmap y=weight x=height / outline nybins=24 nxbins=26;
xaxis display=(noline nolabel noticks) grid
  fitpolicy=stagger values=(51 to 77 by 1);
yaxis display=(noline nolabel noticks) grid
  fitpolicy=none values=(70 to 300 by 10);
gradlegend / notitle;
run;
ods graphics /
  imagename="Fig6-
11_LowerRight_HeatMap_12YbinsBy13Xbins";
title2 height=8pt 'Heat Map - 12 Y bins and 13 X bins';
proc sgplot data=sashelp.heart;
heatmap y=weight x=height / outline nybins=12 nxbins=13;
xaxis display=(noline nolabel noticks) grid
  fitpolicy=stagger values=(51 to 77 by 1);
yaxis display=(noline nolabel noticks) grid
  fitpolicy=none values=(70 to 300 by 10);
gradlegend / notitle;
run;
