/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0153-data-regoutliers.sas --- */
%let N = 100;
/* size of each sample
*/
data RegOutliers(keep=x y Contaminated);
array xx{&N} _temporary_;
p = 0.1;
/* prob of contamination
*/
call streaminit(1);
/* simulate fixed effects */
do i = 1 to &N;
xx{i} = rand("Uniform");
end;
/* simulate regression model */
do i = 1 to &N;
x = xx{i};
Contaminated = rand("Bernoulli",p);
if Contaminated then eps = rand("Normal", 0, 10);
else
eps = rand("Normal", 0, 1);
y = 1 - 2*x + eps;
/* parameters are 1 and -2
*/
output;
end;
run;

/* --- 0154-proc-format.sas --- */
proc format;
value Contam 0="N(0, 1)"
1="N(0, 10)";
run;
proc sgplot data=RegOutliers(rename=(Contaminated=Distribution));
format Distribution Contam.;
scatter x=x y=y / group=Distribution;
lineparm x=0 y=1 slope=-2;
/* requires SAS 9.3 */
run;

/* --- 0155-proc-robustreg.sas --- */
proc robustreg data=RegOutliers method=lts FWLS;
model y = x;
ods select LTSEstimates ParameterEstimatesF;
run;
