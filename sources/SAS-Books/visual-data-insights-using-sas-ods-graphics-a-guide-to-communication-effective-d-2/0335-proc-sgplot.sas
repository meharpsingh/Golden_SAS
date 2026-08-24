ods graphics on / reset=all
scale=off width=2.5in height=2in noborder;
ods region x=0in y=0.6in width=2.5in height=2in;
ods graphics / reset=index imagename="
LeftGraph
";
title justify=left font=Arial Bold height=&GeneralFontSize
  'Female Avg Height By Age';
proc sgplot data=sashelp.class noborder;
where Sex='F';
vbar age / response=height stat=mean
  displaybaseline=off datalabel
  datalabelattrs=(family=Arial size=&GeneralFontSize weight=Bold)
  nooutline fillattrs=(color=red) barwidth=0.5;
yaxis display=none;
xaxis display=(nolabel noline noticks)
  valueattrs=(family=Arial size=&GeneralFontSize weight=Bold);
format age 2. height 2.;
run;
