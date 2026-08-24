data work.ToPlot;
length YcommaX $ 6;
set SASHELP.CLASS;
YcommaX = trim(left(round(weight,1))) || ',' ||
trim(left(round(height,1)));
run;
