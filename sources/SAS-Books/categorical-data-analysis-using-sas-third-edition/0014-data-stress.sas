data stress;
input stress $ outcome $ count;
datalines;
low
f 48
low
u 12
high f 96
high u 94
;
proc freq order=data;
weight count;
tables stress*outcome / chisq measures nocol nopct;
run;
