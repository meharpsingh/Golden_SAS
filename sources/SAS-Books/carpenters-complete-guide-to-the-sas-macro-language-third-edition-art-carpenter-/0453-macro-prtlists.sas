%macro PrtLists;
   %local i;
   %* Create lists;
   proc sql noprint;
      select dsn, keyvar
         into :dsnlst separated by '|', ➊
              :keylst separated by '|' ➋
            from macro3.dbdir;
      %let dsncnt=&sqlobs; ➌
      quit;
   %matrixprint(dlist=dsnlst,vlist=keylst,listcnt=dsncnt) ➍
%mend Prtlists;
%macro matrixprint(DList=,VList=,ListCnt=);
   %local i;
   %do i = 1 %to &&&listcnt; ➎
      proc print data=macro3.%qscan(%unquote(&&&dlist,&i,%str(|)));  ➏
         by %qscan(&&&vlist,&i,%str(|)); ➐
         run;
   %end;
%mend matrixprint;
