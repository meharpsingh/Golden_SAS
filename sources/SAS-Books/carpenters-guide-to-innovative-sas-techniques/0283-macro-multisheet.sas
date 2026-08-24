%macro multisheet(dsn=,bylist=);
ods tagsets.excelxp n
           style=default
           path="&path\results"
           body="E11_2_2a.xls"
           options(sheet_name='none' o
                   sheet_interval='bygroup' p
                   embedded_titles='no'); q
proc sort data=&dsn out=sorted;
   by &bylist;
proc print data=sorted;
   by &bylist; r
   run;
ods tagsets.excelxp close;
%mend multisheet;
