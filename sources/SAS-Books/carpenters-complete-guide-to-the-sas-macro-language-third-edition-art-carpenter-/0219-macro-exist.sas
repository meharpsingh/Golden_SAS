%macro exist(dsn);
   %global exist;
   %if &dsn ne %then %do;
      * An unknown data set causes a
      * compile error that is reflected
      * in the SYSERR macro variable;
      data _null_;
         stop;
         set &dsn;
         run;
   %end;
   %if &syserr=0 %then %let exist=YES;
   %else %let exist=NO;
%mend exist;
