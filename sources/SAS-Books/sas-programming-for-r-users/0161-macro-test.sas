%macro test(dt, condition=50000);
proc means data=&dt;
      where msrp > &condition;
run;
%mend;
