%macro process(dsn=,whr=);
   proc print data=&dsn;
      where &whr; n
      run;
%mend process;
%macro doprocess(dsn=, cvar=);
ods output onewayfreqs=levels; o
proc freq data=&dsn;
   table &cvar;
   run;
data _null_;
   set levels; p
   whr = cats("&cvar='",&cvar,"'"); q
   call execute('%nrstr(%process(dsn='
               ||"&dsn"||',whr='
               ||whr||'))'); r
   run;
%mend doprocess;
