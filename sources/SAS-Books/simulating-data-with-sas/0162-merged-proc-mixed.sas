/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0162-data-randomeffects.sas --- */
%let var_A
= 4;
/* variance of random effect (intercept)
*/
%let sigma2 = 2;
/* variance of residual, e ~ N(0, sqrt(sigma2)) */
%let L = 3;
/* num levels in random effect A
*/
%let k = 5;
/* num repeated measurements in each level of A */
data RandomEffects(drop=mu rndA);
call streaminit(12345);
mu = 5;
do a = 1 to &L;
rndA = rand("Normal", 0, sqrt(&var_A));
do rep = 1 to &k;
y = mu + rndA + rand("Normal", 0, sqrt(&sigma2));
output;
end;
end;
run;

/* --- 0163-proc-mixed.sas --- */
proc mixed data=RandomEffects CL;
class a;
model y = ;
/* no fixed effects
*/
random int / subject=a;
/* a is random intercept effect */
ods select CovParms;
run;
