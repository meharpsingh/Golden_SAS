/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0083-data-ast.sas --- */
data ast;
input therapy $ baseline endpoint count @@;
datalines;
Placebo 0 0 34 Placebo 1 0 2 Placebo 0 1 1 Placebo 1 1 3
Drug
0 0 30 Drug
1 0 1 Drug
0 1 7 Drug
1 1 1
;

/* --- 0089-data-ast2.sas --- */
data ast2;
set ast;
do i=1 to count;
if therapy="Placebo" then gr=1; else gr=0;
subject=10000*gr+1000*baseline+100*endpoint+i;
outcome=baseline; tm=0; int=tm*gr; output;
outcome=endpoint; tm=1; int=tm*gr; output;
end;
proc nlmixed data=ast2 qpoints=50;
ods select ParameterEstimates;
parms intercept=-2.2 group=0.8 time=0.3 interaction=-1.8 sigmasq=1;
logit=intercept+group*gr+time*tm+interaction*int+se;
p=exp(logit)/(1+exp(logit));
model outcome~binary(p);
random se~normal(0,sigmasq) subject=subject;
run;

/* --- 0090-proc-nlmixed.sas --- */
proc nlmixed data=ast2 qpoints=50;
parms intercept=-2.2 group=0.8 time=0.3 interaction=-1.8 sigmasq=1;
logit=intercept+group*gr+time*tm+interaction*int+se;
p0=1/(1+exp(logit));
p1=exp(logit)/(1+exp(logit));
if outcome=0 then logp=log(p0);
if outcome=1 then logp=log(p1);
model outcome~general(logp);
random se~normal(0,sigmasq) subject=subject;
run;
