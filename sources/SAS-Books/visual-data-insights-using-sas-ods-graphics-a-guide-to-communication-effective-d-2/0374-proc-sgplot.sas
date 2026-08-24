ods graphics on /
  reset=all scale=off width=500px height=200px noborder
  outputfmt=SVG imagemap;
title1 justify=left
  "Average Height By Age of Students Whose Names Start with 'J'";
title2 justify=left color=blue underline=1
link="C:\temp\Fig14-8_TableLinkedToGraph.xhtml"
'Go To Table of Information about the Students';
proc sgplot data=sashelp.class(where=(name =: 'J')) noborder
  description=' ';
vbar age / response=height stat=mean datalabel displaybaseline=off
  barwidth=0.5 nooutline fillattrs=(color=green);
yaxis display=none;
xaxis display=(nolabel noline noticks);
format height 4.1 age 2.;
run;
