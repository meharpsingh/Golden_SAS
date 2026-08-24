proc sort data=sashelp.class out=work.ToPlot;
where Name =: 'J'; /* Name must start with 'J' */
by descending height;
run;
ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=2in
  imagename="Fig4-43_SparseNeedlePlotOrBarChart_WithBlockChart";
title justify=center 'Student Ranked Heights & Ages';
proc sgplot data=work.ToPlot noborder;
needle x=name y=height / datalabel datalabelpos=top
  /* No MARKERS and MARKERSATTRS options */
  displaybaseline=off;
block x=name block=age / position=bottom
  valueattrs=(color=white);
xaxis display=(nolabel noline noticks);
yaxis display=none;
run;
