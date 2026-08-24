/* Merged listing: this program was assembled from 6 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0102-data-uti.sas --- */
data uti;
input diagnosis : $13. treatment $ response $ count @@;
datalines;
complicated
A
cured 78
complicated
A not 28
complicated
B
cured 101 complicated
B not 11
complicated
C
cured 68
complicated
C not 46
uncomplicated
A
cured 40
uncomplicated A not 5
uncomplicated
B
cured 54
uncomplicated B not 5
uncomplicated
C
cured 34
uncomplicated C not 6
;

/* --- 0105-proc-logistic.sas --- */
ods graphics on;
proc logistic data=uti
plots(only)=(effect(clband yrange=(.5,1) x=treatment*diagnosis)
oddsratio(logbase=2));
freq count;
class diagnosis treatment;
model response = diagnosis treatment /
scale=none aggregate;
run;

/* --- 0106-proc-logistic.sas --- */
ods select ContrastTest ContrastEstimate;
proc logistic data=uti;
freq count;
class diagnosis treatment /param=ref;
model response = diagnosis treatment;
contrast 'A versus B' treatment 1 -1
/ estimate=exp;
contrast 'A' treatment 1 0;
contrast 'joint test' treatment 1 0,
treatment 0 1;
run;

/* --- 0107-proc-logistic.sas --- */
ods graphics on;
proc logistic data=uti plots(only)=effect(x=treatment
sliceby=diagnosis clbar
connect yrange=(0.5));
freq count;
Stokes, Maura E., Charles S. Davis, and Gary G. Koch. Categorical Data Analysis Using SAS®, Third Edition. Copyright © 2012,
Fitting Models with Interactions
class diagnosis treatment /param=ref;
model response = diagnosis treatment;
oddsratio treatment / cl=pl;
oddsratio treatment / cl=pl;
run;
ods graphics off;
Output 8.31 displays the predicted probabilities for treatment and diagnosis; this is a useful plot for

/* --- 0126-proc-genmod.sas --- */
proc genmod data=uti;
freq count;
class diagnosis treatment;
model response = diagnosis treatment /
link=logit dist=binomial type3 aggregate;
run;

/* --- 0127-proc-genmod.sas --- */
proc genmod data=uti;
freq count;
class diagnosis treatment;
model response = diagnosis treatment /
link=logit dist=binomial;
contrast 'treatment' treatment 1 0 -1 ,
treatment 0 1 -1;
contrast 'A-B' treatment 1 -1
0;
contrast 'A-C' treatment 1
0 -1;
run;
