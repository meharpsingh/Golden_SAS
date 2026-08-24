/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0159-data-logisticdata.sas --- */
%let N = 150;
data LogisticData;
array xx1{&N} _temporary_;
array xx2{&N} _temporary_ ;
call streaminit(1);
/* read or simulate fixed effects */
do i = 1 to &N;
xx1{i} = rand("Uniform");
xx2{i} = rand("Normal", 0, 2);
end;
/* simulate logistic model */
do i = 1 to &N;
x1 = xx1{i};
x2 = xx2{i};
/* linear model with parameters
{2, -4, 1} */
eta = 2 - 4*x1 + 1*x2;
/* eta = X*beta. NO epsilon!
*/
mu = exp(eta) / (1+exp(eta));
/* transform by inverse logit */
y = rand("Bernoulli", mu);
/* binary response
*/
output;
end;
run;

/* --- 0160-proc-logistic.sas --- */
ods graphics on;
proc logistic data=LogisticData plots(only)=Effect;
model y(Event='1') = x1 x2 / clparm=wald;
ods select ParameterEstimates CLParmWald EffectPlot;
run;
