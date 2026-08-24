/* Merged listing: this program was assembled from 5 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0146-data-trial.sas --- */
data trial;
input center treatment $ sex $ age improve initial @@;
datalines;
t f 27 0 1
1 p f 32 0 2 41 t f 13 1 2 41 p m 22 0 3
t f 41 1 3
2 p f 47 0 1 42 t m 31 1 1 42 p f 21 1 3
t m 19 1 4
3 p m 31 0 4 43 t f 19 1 3 43 p m 35 1 3
t m 55 1 1
4 p m 24 1 3 44 t m 31 1 3 44 p f 37 0 2
t f 51 1 4
5 p f 44 0 2 45 t f 44 0 1 45 p f 41 1 1
t m 23 0 1
6 p f 44 1 3 46 t m 41 1 2 46 p m 41 0 1
;

/* --- 0147-proc-logistic.sas --- */
proc logistic data=trial;
class treatment(ref="p") /param=ref;
strata center;
model improve(event="1")= treatment;
run;

/* --- 0148-proc-logistic.sas --- */
proc logistic data=trial;
class sex (ref="f") treatment(ref="p") /param=ref;
strata center;
model improve(event="1") =
treatment initial sex age/
selection=forward include=1 details;
run;

/* --- 0149-proc-logistic.sas --- */
proc logistic data=trial exactonly;
class treatment(ref="p") /param=ref;
strata center;
model improve(event="1") = treatment initial;
exact treatment initial / estimate=both;
run;

/* --- 0150-proc-logistic.sas --- */
proc logistic data=trial;
class sex (ref="f") treatment(ref="p") /param=ref;
strata center;
model improve(event="1") = initial age sex treatment
sex*age sex*initial age*initial
treatment*sex treatment*initial treatment*age /
selection=forward include=4 details ;
run;
