%macro UseDSN;
%local dsncnt i; ➌
proc sql noprint;
   select count(dsn) ➍
      into: dsncnt
         from macro3.dbdir;
   %do i = 1 %to &dsncnt; ➎
      %local dsn&i; ➏
   %end;
   select dsn
      into :dsn1 - ➐
         from macro3.dbdir;
   quit;
