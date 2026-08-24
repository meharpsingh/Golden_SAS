/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0051-data-ra.sas --- */
data ra;
input group $ sjc tjc pta pha @@;
datalines;
Placebo
-5
-9
-14
-21 Placebo
-3
-7
-5
-25
Placebo
-7
-4
-28
-15 Placebo
-3
-17
-6
Placebo
-4
-1
-5
5 Placebo
-8
-11
Placebo
-3
0 Placebo
Placebo
-1
-4
-11
-8 Placebo
Placebo
-2
-9 Placebo
Therapy
-7
-1
-21
-9 Therapy
-6 -11
-36
-12
Therapy
-3
-7
-14
-21 Therapy
-4
-10
Therapy
-11
-4
-28
-45 Therapy
-4
-1
-11
-23
Therapy
-3
-1
-7
-15 Therapy
-5
-9
-36
-15
Therapy
-4
-9
-35
-32 Therapy
-11 -10
-47
-31
Therapy
-1
17 Therapy
-1
-9
-5
-27
;

/* --- 0053-proc-multtest.sas --- */
proc multtest data=ra stepboot n=10000 seed=57283;
class group;
test mean(sjc tjc pta pha);
contrast "Treatment effect" 1 -1;
run;
