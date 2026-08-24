/* Merged listing: this program was assembled from 7 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0027-data-sepsurv.sas --- */
data sepsurv;
call streaminit(9544);
do stratum=1 to 4;
do patient=1 to 400;
if patient<=200 then treat=0; else treat=1;
if stratum=1 and treat=0 then b=25;
if stratum=1 and treat=1 then b=13;
if stratum=2 and treat=0 then b=10;
if stratum=2 and treat=1 then b=13;
if stratum=3 and treat=0 then b=3;
if stratum=3 and treat=1 then b=5.5;
if stratum=4 and treat=0 then b=1.2;
if stratum=4 and treat=1 then b=2.5;
survtime=rand("weibull",0.5,1000*b);
censor=(survtime<=672);
survtime=min(survtime,672);
output;
end;
end;

/* --- 0029-proc-lifetest.sas --- */
proc lifetest data=sepsurv notable;
ods select HomTests;
by stratum;
time survtime*censor(0);
strata treat;
run;

/* --- 0030-proc-lifetest.sas --- */
proc lifetest data=sepsurv notable;
ods select LogUniChisq WilUniChiSq;
by stratum;
time survtime*censor(0);
test treat;
run;

/* --- 0031-proc-lifetest.sas --- */
proc lifetest data=sepsurv notable;
ods select HomTests;
by stratum;
time survtime*censor(0);
strata treat/test=(tarone fleming(0.5));
run;

/* --- 0032-proc-lifetest.sas --- */
proc lifetest data=sepsurv notable;
ods select LogUniChisq WilUniChiSq;
time survtime*censor(0);
strata stratum;
test treat;
run;

/* --- 0033-data-cov.sas --- */
data cov;
treat=0; output;
treat=1; output;
proc phreg data=sepsurv;
model survtime*censor(0)=treat/risklimits;
strata stratum;
baseline out=curve survival=est covariates=cov/nomean;
%macro PlotPH(stratum);
axis1 minor=none label=(angle=90 "Survival") order=(0 to 1 by 0.5);
axis2 minor=none label=("Time (h)") order=(0 to 700 by 350);
symbol1 value=none color=black i=j line=1;
symbol2 value=none color=black i=j line=20;
data annotate;
xsys="1"; ysys="1"; hsys="4"; x=50; y=20; position="5";
size=1; text="Stratum &stratum"; function="label";
proc gplot data=curve anno=annotate;
where stratum=&stratum;
plot est*survtime=treat/frame haxis=axis2 vaxis=axis1 nolegend;
run;
quit;
%mend PlotPH;
%PlotPH(1);
%PlotPH(2);
%PlotPH(3);
%PlotPH(4);

/* --- 0034-proc-phreg.sas --- */
proc phreg data=sepsurv;
model survtime*censor(0)=treat/ties=efron;
strata stratum;
run;
title "Exact method for handling ties";
proc phreg data=sepsurv;
model survtime*censor(0)=treat/ties=exact;
strata stratum;
run;
