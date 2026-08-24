data work.ToPlot;
length DataLabelText $ 11;
set SASHELP.CLASS;
DataLabelText= trim(left(name)) || ',' ||
               trim(left(put(age,2.)));
run;
proc sort data=Work.ToPlot;
by sex;
run;
ods listing style=listing gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename=
  "Fig3-
7_Scatter_Plot_ColorCoded_Markers_and_DataLabels_Not_XorY";
title1 font='Arial/Bold' height=11pt justify=center
  'Weight (pounds) vs Height (inches)';
title2 font='Arial/Bold' height=11pt justify=center
  'With Name, Age, and Sex of the Student';
proc sgplot data=work.ToPlot noborder;
styleattrs datacontrastcolors=(blue red);
