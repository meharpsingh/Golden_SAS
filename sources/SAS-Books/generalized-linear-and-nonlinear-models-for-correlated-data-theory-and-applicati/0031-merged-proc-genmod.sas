/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0031-data-thall.sas --- */
data thall;
input ID y Visit Trt Bline Age;
cards;
104 5 1
0 11 31
104 3 2
0 11 31
104 3 3
0 11 31
104 3 4
0 11 31
106 3 1
0 11 30
106 5 2
0 11 30
106 3 3
0 11 30
106 3 4
0 11 30
...
;
data example4 3 3;
set thall;
y0=log(Bline/4);
LogAge=log(Age);
LogTime=log(2);
Visit4=(Visit=4);
run;
proc sort data=example4 3 3;
by ID Visit;
run;
proc print data=example4 3 3(obs=15) noobs;
var ID y Visit Trt Bline Age y0;
run;
%macro ModelCov(cov=ind);
ods listing close;
ods output ParameterEstimates=pe;
ods output CovParms=covparms;
ods output CovBDetails=covb fit;
ods output Tests3=tests;
proc glimmix data=example4 3 3 empirical;
class ID Visit;
model y = y0 Trt y0*Trt LogAge Visit4
/ dist=Poisson link=log offset=LogTime
covb(details) cl s htype=3;
nloptions maxiter=500;
random
residual
/ subject=ID type=&cov
%if %index(&cov, VC) %then %do; group=Visit %end;;
run;
data pe;
length Structure $4.;
set pe;
Structure=''&cov'';
run;
data covparms;
length Structure $4.;
set covparms;
Structure=''&cov'';
run;

/* --- 0035-proc-genmod.sas --- */
ods graphics on / imagefmt=PS imagename='Epilepsy influence';
proc genmod data=example4 3 3
plots(Clusterlabel)=DFBETACS;
class ID Visit;
model y = Trt LogAge y0 y0*Trt Visit4
/ dist=Poisson link=log offset=LogTime Type3;
repeated subject=ID / type=un ;
run;

/* --- 0036-proc-sort.sas --- */
proc sort data=example4 3 4;
by ID Week;
run;
proc print data=example4 3 4(obs=19) noobs;
run;
ods listing close ;
ods output crosslist=obs;
proc freq data=example4 3 4;
table Trt*Week*IMPS79o /crosslist nocol nopercent;
run;
data obs;
set obs;
ORDER =IMPS79o;
Prob Obs=RowPercent/100;
if Prob Obs>.;
keep Trt Week F IMPS79o IMPS79o
ORDER
Frequency RowPercent Prob Obs;;
run;

/* --- 0038-proc-genmod.sas --- */
ods select NObs ModelInfo GEEModInfo GEEFitCriteria
GEEEmpPEst;
ods output Estimates = Estimates;
proc genmod data=example4 3 4;
class ID;
model IMPS79o = Trt SWeek Trt*SWeek
/ dist=multinomial link=clogit;
repeated subject=ID / type=ind modelse;
estimate 'CumLogOR(Week=0)' Trt 1 Trt*SWeek 0 /exp;
estimate 'CumLogOR(Week=1)' Trt 1 Trt*SWeek 1 /exp;
estimate 'CumLogOR(Week=3)' Trt 1 Trt*SWeek 1.7321 /exp;
estimate 'CumLogOR(Week=3)' Trt 1 Trt*SWeek 2.4495 /exp;
output out=pred prob=CumProb Hat;
run;
