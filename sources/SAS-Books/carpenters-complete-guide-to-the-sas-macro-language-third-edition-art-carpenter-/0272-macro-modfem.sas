%macro modfem(dsn);
   %* Execute only for Females;
   %if &dsn ne FEMALE %then %GOTO skip;
   data &dsn;
      set &dsn;
      wt = wt*2.2;;
      run;
   %skip:
%mend modfem;
