%macro listdsn;
%local dsnlist dsncnt i;
proc sql noprint;
   select distinct dsn
      into :dsnlist separated by ' '
         from macro3.dbdir;
   %let dsncnt = &sqlobs;
   quit;
%do i = 1 %to &dsncnt; ➊
   %put &=i %qscan(&dsnlist,&i,%str( )); ➋
%end;
%mend listdsn;
