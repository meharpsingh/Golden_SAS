ods graphics on /
  reset=all scale=off width=2.5in height=2.0in noborder;
/* the output format is set to PNG on the ODS PRINTER statement */
ods region x=0in y=0.5in width=2.5in height=2.0in;
title justify=center 'Weight vs Height';
proc sgplot data=sashelp.class(where=(name =: 'J')) noborder;
scatter x=height y=weight /
  markerattrs=(symbol=CircleFilled color=green);
xaxis display=(noline noticks nolabel)
      values=(51 to 65 by 2);
yaxis display=(noline noticks nolabel)
      values=(50 to 115 by 13) fitpolicy=none;
run;
