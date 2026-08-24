proc rank data=dat out=tmp groups=3;
  var DxDur;
  ranks DxDurCat;
run;
data dat;
  set tmp;
  if DxDurCat=. then DxDurCat=99; else DxDurCat=DxDurCat+1;
  chgBPIPain_LOCF=BPIPain_LOCF-BPIPain_B;
  if chgBPIPain_LOCF>.; * delete 2 patients with missing outcome;
run;
*** List variables for input into PS model;
* PS model: categorical variables;
%let pscat=
  Gender
  Race
  DxDurCat
  DrSpecialty;
* PS model: continuous variables;
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
   where effect~='Intercept';
    select count(distinct effect) into :nyeff
    from yPE
    where effect~='Intercept';
quit;
* force Xs associated with outcome into PS model;
proc logistic data = dat namelen=200;
  class cohort &pscat/param=ref;
  model cohort = &yeffects &pscat &pscnt
    /link=glogit include=&nyeff selection=stepwise sle=.20 sls=.20
  hier=none;
  output out=gps pred=ps;
  ods output ParameterEstimates=gps_pe;
run;
** trimming based on Crump et al. (2009);
proc transpose data=gps out=gpsdatt prefix=ps;
  by subjid cohort;
  var ps;
run;
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
  *one step is often sufficient, i.e. the later integration does not change
   the value of alpha. To be safe, you can iterate;
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
******************************************************************
*  Section 2: VM Macro to a) use FASTCLUS to form clusters,      *
*             b) use PSMATCH to conduct 1:1 matching, c)         *
*             compute treatment effect and variance estimates,   *
*             d) report results                                  *
******************************************************************;
