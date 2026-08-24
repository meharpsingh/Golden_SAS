data work.ToPlot;
length YcommaX $ 6;
set SASHELP.CLASS;
YcommaX = trim(left(round(weight,1))) || ',' ||
          trim(left(round(height,1)));
run;
ods listing style=listing gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename=
  "Fig3-
6_Scatter_Plot_X_and_Y_Data_Labels_Both_Axes_Omitted";
title font='Arial/Bold' height=11pt
  'Weight (pounds) vs Height (inches) - both rounded to
integers';
proc sgplot data=work.ToPlot noborder;
scatter y=weight x=height / datalabel=YcommaX
  datalabelattrs=(family=Arial size=11pt weight=Bold);
yaxis display=none;
xaxis display=none; /* There is no use for the axis here.
*/
run;
