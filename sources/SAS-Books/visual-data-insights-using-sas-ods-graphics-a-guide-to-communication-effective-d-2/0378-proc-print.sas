ods html5 close;
ods excel style=AllTextFontArial12ptBold_BlackWhiteTable
file= "C:\temp\Fig14-9_ExcelWorkSheetLinkedToGraph.xlsx"
options(embedded_titles='yes'
title_footnote_nobreak='yes'
sheet_name='Information about Students');
/* sheet_name limit is 24 characters */
title1 justify=left
  "Information about Students Whose Names Start with 'J'";
title2 justify=left color=blue underlin=1
link="C:\temp\Fig14-9_GraphLinkedToExcelWorkSheet.xhtml"
"Go To Graph of Student Average Height By Age";
proc print data=sashelp.class(where=(name =: 'J')) noobs;
run;
