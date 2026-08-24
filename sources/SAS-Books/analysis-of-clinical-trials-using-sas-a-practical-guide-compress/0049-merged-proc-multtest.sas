/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0049-data-trouble.sas --- */
data trouble;
input group outcome count @@;
datalines;
1 0 4
1 1 0
2 0 1
2 1 3
3 0 3
3 1 1
;
proc multtest data=trouble stepboot seed=443 n=20000;
title "Adjustment based on the Fisher exact test";
class group;
freq count;
test fisher(outcome/lower);
contrast "1 vs 2" 1 -1 0;
contrast "1 vs 3" 1
0 -1;
contrast "2 vs 3" 0
1 -1;

/* --- 0050-proc-multtest.sas --- */
proc multtest data=trouble stepboot seed=443 n=20000;
title "Adjustment based on the Freeman-Tukey test";
class group;
freq count;
test ft(outcome/lower);
contrast "1 vs 2" 1 -1 0;
contrast "1 vs 3" 1
0 -1;
contrast "2 vs 3" 0
1 -1;
run;
