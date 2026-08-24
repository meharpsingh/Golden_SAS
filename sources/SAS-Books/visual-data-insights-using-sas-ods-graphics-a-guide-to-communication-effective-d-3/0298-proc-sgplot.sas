ods listing style=GraphFontArial11ptBold
gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
height=2in
  imagename="Fig12-
2_BasicBoxPlotWithOutliersSuppressed";
title1
  'Distribution of Female Height (inches) in
SASHELP.HEART Data Set'
  color=blue ' (outliers not shown)';
proc sgplot data=sashelp.heart noborder;
where Sex EQ 'Female' AND Height NE .;
hbox Height / nooutliers
  fillattrs=(color=yellow)
  medianattrs=(color=black thickness=3px)
  meanattrs=(color=red symbol=DiamondFilled)
  lineattrs=(thickness=3px)
  whiskerattrs=(thickness=3px)
  nocaps;
xaxis display=(noline noticks nolabel)
  grid gridattrs=(color=black);
run;
