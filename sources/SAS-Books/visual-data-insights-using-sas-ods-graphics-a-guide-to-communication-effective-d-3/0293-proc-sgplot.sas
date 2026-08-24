ods listing style=GraphFontArial11ptBold
gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename="Fig11-
5_RegressionByGroupVarAndRegressionForAll";
title1 'Student Weight (pounds) vs Height (inches)';
proc sgplot data=sashelp.class noborder;
styleattrs datacontrastcolors=(blue red);
