proc sql noprint;
   select memname
      into :cname1-
         from sashelp.vscatlg ➊
            where libname="%upcase(&test)"
                   and substr(memname,1,2) in ('WE', 'DE', 'PH'); ➋
   %let catcnt = &sqlobs; ➌
   quit;
proc datasets nolist;
   copy in=&test out=&prod memtype=catalog;
      select
        %do i = 1 %to &catcnt;
            &&cname&i ➍
        %end;
      ;
   quit;
%mend catcopy;
