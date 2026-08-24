/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0085-data-normal.sas --- */
data normal;
* data set;
call streaminit(1234567);
* set random number stream;
do n = 1 to 40;
* do loop 40 times;
if n < 21 then x = 10;
* x = 10 for n<=20;
else x = 20;
* x = 20 for n>20;
e = rand('normal',0,50);
* e is N(0,2500);
y = 100 + 10*x + e;
* DGP=data generating process;
output;
* observation to data set;
end;
* end do loop;
run;

/* --- 0086-proc-print.sas --- */
proc print data=normal(firstobs=15 obs=25);
var x y;
title 'Observations from normal DGP';
run;

/* --- 0087-proc-means.sas --- */
proc means data=normal css;
* summary stats;
var x;
* specify variable;
title 'corrected ss for x';
run;

/* --- 0089-proc-reg.sas --- */
proc reg data=normal outest=est tableout mse;
model y = x;
title 'regression with normal data';
title2 'true intercept = 100 & slope = 10';
run;
