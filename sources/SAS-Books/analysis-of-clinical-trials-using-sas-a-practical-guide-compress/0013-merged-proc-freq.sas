/* Merged listing: this program was assembled from 9 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0013-data-sepsis.sas --- */
data sepsis;
input stratum therapy $ outcome $ count @@;
if outcome="Dead" then survival=0; else survival=1;
datalines;
1 Placebo Alive 189 1 Placebo Dead 26
1 Drug
Alive 185 1 Drug
Dead 33
2 Placebo Alive 165 2 Placebo Dead 57
2 Drug
Alive 169 2 Drug
Dead 49
3 Placebo Alive 104 3 Placebo Dead 58
3 Drug
Alive 156 3 Drug
Dead 48
4 Placebo Alive 123 4 Placebo Dead 118
4 Drug
Alive 130 4 Drug
Dead 80
;
proc freq data=sepsis;
where stratum=4;
table therapy*survival/riskdiff relrisk;
weight count;
run;

/* --- 0016-proc-freq.sas --- */
proc freq data=sepsis;
table stratum*therapy*survival/cmh;
weight count;
run;

/* --- 0018-proc-multtest.sas --- */
proc multtest data=sepsis;
class therapy;
freq count;
strata stratum;
test ca(survival/permutation=500);
run;

/* --- 0020-proc-logistic.sas --- */
proc logistic data=sepsis;
class therapy stratum;
model survival=therapy stratum/clodds=pl;
freq count;
run;

/* --- 0021-proc-genmod.sas --- */
proc genmod data=sepsis;
class therapy stratum;
model survival=therapy stratum/dist=bin link=logit type3;
freq count;
run;

/* --- 0022-proc-genmod.sas --- */
proc genmod data=sepsis;
class therapy stratum;
model survival=therapy stratum/dist=bin link=logit type3;
freq count;
estimate "PROC LOGISTIC treatment effect" therapy 1 -1 /divisor=2;
run;

/* --- 0023-proc-logistic.sas --- */
proc logistic data=sepsis;
class therapy stratum/param=glm;
model survival=therapy stratum/clodds=pl;
freq count;
run;

/* --- 0025-proc-logistic.sas --- */
proc logistic data=sepsis exactonly;
class therapy stratum/param=reference;
model survival(event="0")=therapy stratum;
exact therapy/estimate=odds;
freq count;
run;

/* --- 0026-proc-logistic.sas --- */
proc logistic data=sepsis exactonly;
class therapy/param=reference;
model survival(event="0")=therapy;
strata stratum;
exact therapy/estimate=odds;
freq count;
run;
