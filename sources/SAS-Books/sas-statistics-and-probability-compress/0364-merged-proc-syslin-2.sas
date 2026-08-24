/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0364-data-datagen.sas --- */
data datagen;
nobs = 20000;
* number of observations;
do n = 1 to nobs;
* do loop nobs times;
call streaminit(1234567);
* set random number stream;
/* create 5 N(0,1) random variables */
z1=rand('normal',0,1);
z2=rand('normal',0,1);
z3=rand('normal',0,1);
z4=rand('normal',0,1);
z5=rand('normal',0,1);
/* apply cholesky transformation */
dat1 = z1;
dat2 = .6*Z1 + .8*Z2;
dat3 = .5*Z1 - .375*z2 + .7806247*z3;
dat4 = .3*z1 - .225*z2 - .30024*z3 + .877058*z4;
dat5 = .5*z1 - .320256*z3 - .280659*z4 + .7540999*z5;
output;
end;
run;

/* --- 0366-data-table10.sas --- */
data table10;
* data set;
set datagen;
* read data;
x = dat1;
* endogenous regressor;
e = dat2;
* regression error;
z1 = dat3;
* valid iv #1;
z2 = dat4;
* valid iv #2;
z3 = dat5;
* invalid iv #3;
ey = 1 + 1*x;
* regression function;
y = ey+e;
* dependent variable;
run;

/* --- 0369-data-n10000.sas --- */
data n10000;
set table10;
if _n_ <= 10000;
run;
proc reg data=n10000;
model y = x;
title 'ols regression with n=10,000';
run;

/* --- 0370-proc-syslin.sas --- */
proc syslin data=n10000 2sls;
endogenous x;
instruments z1 z2;
model y = x;
title '2sls with n=10,000';
run;
