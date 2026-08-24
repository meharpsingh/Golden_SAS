proc freq data=asthma;
tables dose*change/noprint jt;
exact jt;
run;
