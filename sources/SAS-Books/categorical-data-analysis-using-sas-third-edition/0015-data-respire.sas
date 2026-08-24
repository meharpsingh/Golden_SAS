data respire;
input treat $ outcome $ count;
datalines;
test
yes
test
no
placebo yes
placebo no
;
proc freq order=data;
weight count;
tables treat*outcome / all nocol nopct;
run;
