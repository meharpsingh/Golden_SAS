%macro means(dsn=);
  %if %obscnt(&dsn) < 25 %then %return;
  proc means data=&dsn noprint;
  ...Code not shown...
%mend means;
