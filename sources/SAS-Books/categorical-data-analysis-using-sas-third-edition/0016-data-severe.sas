data severe;
input treat $ outcome $ count;
datalines;
Test
f 10
Test
u 2
Control f 2
Control u 4
;
proc freq order=data;
weight count;
tables treat*outcome / nocol;
exact or;
run;
