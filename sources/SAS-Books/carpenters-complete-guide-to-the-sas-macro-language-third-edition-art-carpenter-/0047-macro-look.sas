%macro look(dsn,obs=10);
  title "data set &dsn";
  proc contents data=&dsn;
    run;
  title2 "first &obs observations";
  proc print data=&dsn (obs=&obs);
    run;
%mend look;
