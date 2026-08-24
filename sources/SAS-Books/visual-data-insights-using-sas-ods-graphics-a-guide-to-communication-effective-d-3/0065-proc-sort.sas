proc sort data=sashelp.class out=work.ToPlot;
where Name =: 'J'; /* Name must start with 'J' */
by descending height;
run;
ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=2in
  imagename="Fig4-42Lower_NeedlePlotWithBlockChart";
title justify=center 'Student Ranked Heights & Their Ages';
proc sgplot data= work.ToPlot noborder;
needle x=name y=height / datalabel
  datalabelpos=top /* default as in Figure 4-41 is UpperRight */
  markers markerattrs=(color=red symbol=CircleFilled size=11pt)
  displaybaseline=off;
block x=name block=age / position=bottom
  valueattrs=(color=white); /* To create the upper example
