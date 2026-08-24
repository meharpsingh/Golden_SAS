%macro varlist(dsn=);
%local i;
* Determine the list of variables in this
* base data set;
proc contents data= &dsn ➊
              out= cont noprint;
   run;
* Collect the variable names;
proc sql noprint;
   select distinct name ➋
      into :varname1-:varname999 ➌
         from cont;
   quit;
%do i = 1 %to &sqlobs; ➍
   %put &i &&varname&i;
%end;
%mend varlist;
