%macro showstyles;
%local i stylecnt;
proc sql noprint;
   select scan(style,2,'.')
      into: style1-
         from sashelp.vstyle ➊
            where scan(style,1,'.')='Styles';
   %let stylecnt = &sqlobs; ➋
   quit;
%do i = 1 %to &stylecnt; ➌
ods tagsets.excelxp ➍
         path="&path\chapter 12\Results"
         file="&&style&i...xls" ➎
         style=&&style&i ➏
         options(sheet_name="&&style&i" ➐
                 embedded_titles='yes'
                  );
      title2 "Using the &&style&i Style";
      proc report data=sashelp.class;
         column sex name age height weight;
         define sex    / order;
         define name   / display;
         define age    / analysis mean f=4.1;
         define height / analysis mean f=4.1;
         define weight / analysis mean f=5.1;
         break after sex / summarize suppress;
         rbreak after /summarize;
         run;
%end;
   ods tagsets.excelxp close;
%mend showstyles;
