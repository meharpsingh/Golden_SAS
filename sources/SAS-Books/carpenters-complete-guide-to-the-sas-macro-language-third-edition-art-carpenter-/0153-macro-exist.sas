%macro exist(dsn=);
%global exist;
%if &dsn ne %then %str( ➊
   data _null_;
   stop; ➌
   set &dsn; ➋
   run;
