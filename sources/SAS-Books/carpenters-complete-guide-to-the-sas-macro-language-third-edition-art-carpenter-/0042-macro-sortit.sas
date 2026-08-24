%macro sortit(dsn,bylist);
    proc sort data=&dsn;
      by &bylist;
      run;
%mend sortit;
