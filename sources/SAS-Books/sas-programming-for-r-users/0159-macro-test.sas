%macro test(condition=50000,dt);
    proc means data=dt;
        where msrp > &condition;
    run;
%mend;
