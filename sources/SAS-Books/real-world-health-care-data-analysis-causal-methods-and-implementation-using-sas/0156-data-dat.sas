data dat;
  set REFL;
run;
* we will use categorized version of DxDur with 99 as missing value;
proc rank data=dat out=tmp groups=3;
  var DxDur;
  ranks DxDurCat;
run;
data dat;
  set tmp;
  if DxDurCat=. then DxDurCat=99; else DxDurCat=DxDurCat+1;
  chgBPIPain_LOCF=BPIPain_LOCF-BPIPain_B;
  if chgBPIPain_LOCF>.; * we have 2 obs with missing Y;
run;
* baseline variables for ITR & PS models;
* categorical variables;
%let pscat=
  Gender
  Race
  DxDurCat
  DrSpecialty;
* continuous variables;
%let pscnt=
  Age
  BMI_B
  BPIInterf_B
  BPIPain_B
  CPFQ_B
  FIQ_B
  GAD7_B
  ISIX_B
  PHQ8_B
  PhysicalSymp_B
  SDS_B;
*** 1b. estimate propensity scores;
* identify Xs associated with outcome;
proc glmselect data=dat namelen=200;
    class &pscat;
    model chgBPIPain_LOCF=&pscat &pscnt
      /selection=stepwise hier=none;
    ods output ParameterEstimates=yPE;
run;
proc sql noprint;
    select distinct effect into :yeffects separated by ' '
    from yPE
    where effect~='Intercept'
    ;
    select count(distinct effect) into :nyeff
    from yPE
    where effect~='Intercept'
    ;
quit;
* force Xs associated with outcome into PS model;
proc logistic data = dat namelen=200;
  class cohort &pscat/param=ref;
  model cohort = &yeffects &pscat &pscnt
    /link=glogit include=&nyeff selection=stepwise sle=.20 sls=.20 hier=none;
  output out=gps pred=ps;
  ods output ParameterEstimates=gps_pe;
run;
*** 1c. trimming;
proc transpose data=gps out=gpsdatt prefix=ps;
  by subjid cohort;
  var ps;
run;
* based on Crump et al. (2009);
%let lambda=;
proc iml;
  use gpsdatt(keep=ps:); read all into pscores; close gpsdatt;
  start obj1(alpha) global(gx);
    uid=gx<alpha;
    return(mean(gx#uid)/mean(uid));
  finish;
  start obj(alpha) global(gx);
    uid=gx<alpha;
    return(mean(gx#uid)/mean(uid)##2);
  finish;
  gx=(1/pscores)[,+];
  mx0=median(gx);
  call nlpnms(rc,xr,'obj') x0=mx0;
  xr=2#obj1(xr);
  *one step is often sufficient, i.e. the later integration does not change the
   value of alpha. To be safe, you can iterate;
  xr=2#obj1(xr);
  call symputx('lambda',xr);
  create gx var {gx}; append; close gx;
quit;
data gpsdatt;
  merge gpsdatt gx;
  trim=gx>&lambda;
run;
title1 "trimming details";
proc freq data=gpsdatt;
  table trim*cohort;
run;
title1;
data gps;
  merge gps gpsdatt(keep=subjid trim);
  by subjid;
  if ~trim;
  drop trim;
run;
data dpat;
  set gps;
  if cohort=_level_;
  OnOpt_IPW=1/ps;
run;
*** 1d. create numerical equivalent (_leveln_) of the &cohort;
proc sql;
       create table cohorts as
              select distinct cohort
              from dpat
       ;
quit;
* we will need the format to report this numerical &cohort;
data cohorts;
       set cohorts;
       cohortn=_n_;
       fmtname='cohort';
       cfmtname='$cohort';
run;
