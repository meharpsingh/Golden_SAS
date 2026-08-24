data respire;
input treat $ outcome $ count;
datalines;
placebo f 16
placebo u 48
test
f 40
test
u 20
;
proc freq;
weight count;
tables treat*outcome / chisq;
run;
