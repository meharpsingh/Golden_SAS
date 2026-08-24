data arth;
input treat $ response $ count @@;
datalines;
active
none 13
active
some 7
active
marked 21
placebo
none 29
placebo
some 7
placebo marked
;
proc freq data=arth order=data;
weight count;
tables treat*response / chisq nocol nopct;
run;
