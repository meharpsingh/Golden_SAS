ods listing style=GraphFontArial11ptBold
gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename="Fig11-
6_LinearAndQuadraticAndCubicRegression";
title1 'Student Weight (pounds) vs Height (inches)';
proc sgplot data=sashelp.class noborder;
reg x=height y=weight /
  name='linear' legendlabel='Linear Regression'
  nomarkers
  lineattrs=(color=CXFF00FF thickness=3px) /* Solid by
default */
  degree=1;
