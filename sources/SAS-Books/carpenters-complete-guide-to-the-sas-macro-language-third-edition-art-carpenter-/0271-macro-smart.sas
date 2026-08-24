%macro smart(dsn);
  %*AVOID GOTO WHEN POSSIBLE;
  data wt;
  set &dsn;
  %if &dsn=FEMALE %then wt = wt*2.2;;
  run;
%mend smart;
