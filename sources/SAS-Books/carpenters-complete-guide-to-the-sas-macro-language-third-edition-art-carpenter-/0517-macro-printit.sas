%macro printit();  ➊
   %put Executing PRINTIT for &lib &dsn &num; ➋
   %let lib  = %sysfunc(dequote(&lib));  ➌
   %let dsn  = %sysfunc(dequote(&dsn));
   %if &num= %then %let num=max; ➍
   title2 "&lib..&dsn"; ➎
   title3 "First &num Observations";
   proc print data=&lib..&dsn(obs=&num);
      run;
%mend printit;
