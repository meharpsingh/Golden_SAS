%macro calc(dsn,vars);
    proc means data=&dsn;
       var &vars;
    run;
%mend calc;
