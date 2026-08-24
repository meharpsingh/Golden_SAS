data sepsis1;
input center therapy $ outcome $ count @@;
if outcome="Dead" then survival=0; else survival=1;
datalines;
1 Placebo Alive 2 1 Placebo Dead 2
1 Drug
Alive 4 1 Drug
Dead 0
2 Placebo Alive 1 2 Placebo Dead 2
2 Drug
Alive 3 2 Drug
Dead 1
3 Placebo Alive 3 3 Placebo Dead 2
3 Drug
Alive 3 3 Drug
Dead 0
;
proc freq data=sepsis1;
table center*therapy*survival/cmh;
weight count;
proc multtest data=sepsis1;
class therapy;
freq count;
strata center;
test ca(survival/permutation=20);
run;
