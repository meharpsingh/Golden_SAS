ods listing style=listing gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename="Fig3-4_Scatter_Plot_Custom_Title_And_Axes";
title font='Arial/Bold' height=11pt
  'Weight (pounds) vs Height (inches)';
proc sgplot data=sashelp.class noborder;
scatter y=weight x=height;
