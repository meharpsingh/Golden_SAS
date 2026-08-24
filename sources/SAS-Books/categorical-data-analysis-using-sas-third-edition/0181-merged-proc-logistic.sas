/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0181-data-assay.sas --- */
data assay;
input drug $ dose status $ count;
int_n=(drug='n');
int_s=(drug='s');
ldose=log(dose);
datalines;
n 0.01
dead
n 0.01
alive 30
n
.03
dead
n
.03
alive 29
n
.10
dead
n
.10
alive
n
.30
dead
n
.30
alive
n 1.00
dead
n 1.00
alive
n 3.00
dead
n 3.00
alive
n 10.00
dead
n 10.00
alive
;

/* --- 0182-proc-logistic.sas --- */
proc logistic data=assay descending;
freq count;
model status = int_n int_s
ldose*int_n ldose*int_s
ldose*int_n*ldose*int_n
ldose*int_s*ldose*int_s
/ noint
scale=none aggregate
include=4 selection=forward details;
eq_slope: test int_nldose=int_sldose;
run;

/* --- 0183-proc-logistic.sas --- */
proc logistic data=assay descending outest=estimate
(drop= intercept _link_ _lnlike_) covout;
freq count;
model status = int_n int_s ldose /
noint scale=none aggregate covb;
run;
