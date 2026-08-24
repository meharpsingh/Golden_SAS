proc sgplot data=sashelp.class(where=(name =: 'J')) noborder
  description=' ';
vbar age / response=height stat=mean datalabel
displaybaseline=off
  barwidth=0.5 nooutline fillattrs=(color=green);
yaxis display=none;
xaxis display=(nolabel noline noticks);
format height 4.1 age 2.;
run;
ods html5 close;
ods html5 path="C:\temp"
  body="Fig14-8_TableLinkedToGraph.xhtml"
  (title="Information about Students Whose Names Start with
'J'")
  style=AllTextFontArial12ptBold_BlackWhiteTblNoGrid;
title1 justify=left
  "Information about Students Whose Names Start with 'J'";
title2 justify=left color=blue underlin=1
  link="C:\temp\Fig14-8_GraphLinkedToTable.xhtml"
  "Go To Graph of Student Average Height By Age";
proc print data=sashelp.class(where=(name =: 'J')) noobs;
run;
ods html5 close;
options center; /* undo OPTIONS NOCENTER which would persist
