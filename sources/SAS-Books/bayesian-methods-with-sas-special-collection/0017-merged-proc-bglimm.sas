/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0017-data-dbp.sas --- */
data DBP;
input Patient Visit Center Treat$ DBP DBP1;
datalines;
79 3 1 Carvedil 96 100
79 4 1 Carvedil 108 100
80 3 1 Nifedipi 82 100
80 4 1 Nifedipi 92 100
80 5 1 Nifedipi 90 100
80 6 1 Nifedipi 100 100
81 3 1 Atenolol 86 100
... more lines ...
237 5 41 Atenolol 80 104
237 6 41 Atenolol 90 104
238 3 41 Nifedipi 88 112
238 4 41 Nifedipi 100 112
;

/* --- 0018-proc-bglimm.sas --- */
proc bglimm data=DBP seed=98876 nmc=10000 thin=2 dic;
class Patient Center Treat;
model DBP = DBP1 Treat Visit ;
random intercept / subject = Center;
random intercept / subject = Patient(center);
estimate 'Carvedil vs. Atenolol' Treat -1 1
0;
estimate 'Carvedil vs. Nifedipi' Treat 0
1 -1;
run;

/* --- 0019-proc-bglimm.sas --- */
proc bglimm data=DBP seed=98876 nmc=10000 thin=2 dic;
class Patient Center Treat;
model DBP = DBP1 Treat Visit ;
random intercept Visit / subject = Center type=un;
random intercept / subject = Patient(center);
run;
