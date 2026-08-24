%macro PrtLists;
%local i;
%* Create lists;
proc sql noprint;
   select dsn, keyvar
      into :dsn1-, ➊
Chapter 14: Miscellaneous Topics   403
           :keyvar1-
         from macro3.dbdir;
   %let dsncnt=&sqlobs;
   quit;
%do i = 1 %to &dsncnt; ➋
   %put %str( ➌
   title1 "Showing Data Table &&dsn&i";
proc print data=macro3.&&dsn&i; ➍
by &&keyvar&i;
run;
   );
%end;
%mend Prtlists;
