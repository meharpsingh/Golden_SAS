proc sql noprint;
   select distinct dsn ➊
      into :dsnlist ➋
   separated by ' ' ➌
             from macro3.dbdir; ➍
   %let dsncnt = &sqlobs; ➎
   quit;
%put &=dsncnt;
%put &=dsnlist;
