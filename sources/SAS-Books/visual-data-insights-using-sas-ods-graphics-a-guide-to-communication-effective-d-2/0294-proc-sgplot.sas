ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename=
"Fig11-2_CustomScatterPlotAndConfidenceAnePredictionEllipses";
title1 'Student Weight (pounds) vs Height (inches)';
proc sgplot data=sashelp.class noborder;
ellipse x=height y=weight /
name='EllipseForMean' type=MEAN
  lineattrs=(color=red thickness=2px); /* for first ELLIPSE statement in the PROC step, the default line pattern is solid */
ellipse x=height y=weight /
name='EllipseForPredicted' type=PREDICTED
lineattrs=
(color=blue thickness=2px
pattern=Solid)
;
