%macro TolLimit(dataset,var,gamma,beta,outdata);
data _null_;
set &dataset nobs=m;
call symput("n",compress(put(m,6.0)));
run;
data _null_;
prev1=probbeta(&gamma,&n,1);
do s=2 to &n;
next1=probbeta(&gamma,&n-s+1,s);
if prev1<=1-&beta and next1>1-&beta then
call symput("rank1",compress(put(s-1,6.0)));
prev1=next1;
end;
prev2=probbeta(&gamma,&n-1,2);
do s=2 to &n/2;
next2=probbeta(&gamma,&n-2*s+1,2*s);
if prev2<=1-&beta and next2>1-&beta then
call symput("rank2",compress(put(s-1,6.0)));
prev2=next2;
end;
run;
proc rank data=&dataset out=ranks;
var &var;
ranks ranky;
proc sort data=ranks;
by ranky;
Appendix
data upper1;
set ranks;
if ranky>&n-&rank1+1 then delete;
data _null_;
set upper1 nobs=m;
if _n_=m then call symput("upper1",compress(put(&var,best8.)));
data upper2;
set ranks;
if ranky>&n-&rank2+1 then delete;
data _null_;
set upper2 nobs=m;
if _n_=m then call symput("upper2",compress(put(&var,best8.)));
data lower2;
set ranks;
if ranky>&rank2 then delete;
data _null_;
set lower2 nobs=m;
if _n_=m then call symput("lower2",compress(put(&var,best8.)));
run;
data &outdata;
upper1=&upper1; lower2=&lower2; upper2=&upper2;
label upper1="Upper one-sided tolerance limit"
upper2="Upper two-sided tolerance limit"
lower2="Lower two-sided tolerance limit";
run;
%mend TolLimit;
