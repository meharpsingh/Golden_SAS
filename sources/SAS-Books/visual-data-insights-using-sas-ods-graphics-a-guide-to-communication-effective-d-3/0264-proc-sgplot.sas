PROC SGPLOT or PROC SGPANEL.
/* For image at left: */
ods listing style=GraphFontArial10ptBold gpath="C:\temp"
dpi=300;
ods graphics on / reset=all scale=off width=2.8in
height=2.8in
  imagename="Fig10-1Left_SGPLOT_ScatterPlot";
title1 justify=center 'Weight (lbs.) vs Height (in.) By
Sex';
proc sgplot data=sashelp.class noborder;
styleattrs datacontrastcolors=(red blue);
