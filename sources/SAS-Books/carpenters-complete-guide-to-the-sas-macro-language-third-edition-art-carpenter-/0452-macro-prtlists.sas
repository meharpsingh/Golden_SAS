%macro PrtLists;
   %local i;
   %* Create lists;
   proc sql noprint;
      select dsn, keyvar
         into :dsn1-,
              :keyvar1-
            from macro3.dbdir;
      %let dsncnt=&sqlobs;
      quit;
   %matrixprint(dlist=dsn,vlist=keyvar,listcnt=dsncnt) ➎
%mend Prtlists;
%macro matrixprint(DList=,VList=,ListCnt=);
   %local i;
   %do i = 1 %to &&&listcnt; ➏
      proc print data=macro3.&&&dlist&i; ➐
         by &&&vlist&i; ➑
         run;
   %end;
%mend matrixprint;
