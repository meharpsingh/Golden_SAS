  proc sql;
    select estimate into :EstAte from pe where substr(parameter,1,1)='T' and
       stderr~=.;
    select count(distinct binN) into :nbins from &dat;
  quit;
  %let fit=&EstAte;
  %if &nbins=%eval(&exeDatBinN-1) %then %do;
    %let fit=&fit#&dat#&psvar;
  %end;
%mend fit_MatchFullOpt;
%macro prd_MatchFullOpt(dat,dout=yprd);
  %local mnam; %let mnam=&sysmacroname; %verbose(&mnam &dat &dout &fit);
  %local nbins EstAte psvar trts;
  proc sql;
    select count(distinct binN) into :nbins from &dat;
  quit;
  %if &nbins>1 %then %do;
    * prediction on training or on all data: here we are interested in ATE, i.e. we
      do not care about patient level prediction;
    %let EstAte=%scan(&fit,1,#);
    data &dout;
      set &dat;
      yprd=T*&EstAte;
      keep ordr yprd;
    run;
    %return;
  %end;
  * prediction on test set;
  data dattr;
    set %scan(&fit,2,#);
  run;
  %let psvar=%scan(&fit,3,#);
  proc sql;
    select distinct T into :trts from &dat;
  quit;
  data dat2;
    set &dat dattr(in=b where=(T=&trts));
    if b then T=0; else T=1;
  run;
  proc psmatch data=dat2 region=allobs;
    where &psvar>.;
    class T;
    psdata treatvar=T(treated='1') ps=&psvar;
    match method=full(kmax=4 kmaxtreated=4) distance=lps caliper=.;
    output out(obs=match)=mtchs matchid=matchid;
  run;
  proc sql;
    create table avg0 as
      select distinct matchid,mean(Y) as yprd
      from mtchs(where=(T=0))
      group matchid
    ;
    create table &dout as
      select ordr,yprd
      from mtchs(where=(T=1) keep=T ordr matchid) natural join avg0
      order ordr
    ;
  quit;
%mend prd_MatchFullOpt;
***************************************************************;
* Outcome model as stratification into 5 strata;
* The TE (for change in BPIPain) is adjusted for baseline pain (BPIPain_B);
%macro fit_StratPS5(dat,wts);
  %local mnam; %let mnam=&sysmacroname; %verbose(&mnam &dat &wts);
  %local psvar nbins EstAte;
  %let psvar=ps%substr(&wts,4);
  proc psmatch data=&dat region=allobs;
    where &psvar>.;
    class T;
    psdata treatvar=T(treated='1') ps=&psvar;
    strata nstrata = 5 key = total;
    output out(obs=all)=strats strata=PSS;
  run;
  proc sort data=strats;
    by pss;
  run;
  * model for ATE adjustment;
  proc glm data=strats;
    class T/ref=first;
    model Y=T BPIPain_B/solution;
    ods output ParameterEstimates=pe;
    by PSS;
    store ymdl;
  run;
  quit;
  * get adjusted ATE and #bins;
  proc sql;
    create table ests as select distinct PSS, estimate from pe where
substr(parameter,1,1)='T' and stderr~=.;
    create table tots as select distinct PSS, count(*) as n from strats group PSS;
    create table estsn as select * from ests natural join tots;
    select sum(n*estimate)/sum(n) into :EstAte from estsn;
    select count(distinct binN) into :nbins from &dat;
  quit;
  %let fit=&EstAte;
  %if &nbins=%eval(&exeDatBinN-1) %then %do;
    %let fit=&fit#strats#&psvar;
  %end;
%mend fit_StratPS5;
%macro prd_StratPS5(dat,dout=yprd);
  %local mnam; %let mnam=&sysmacroname; %verbose(&mnam &dat &fit);
  %local nbins EstAte psvar trts;
  proc sql;
    select count(distinct binN) into :nbins from &dat;
  quit;
  %if &nbins>1 %then %do;
    * prediction on training or on all data: here we are interested in ATE,
      i.e. we do not care about patient level prediction;
    %let EstAte=%scan(&fit,1,#);
    data &dout;
      set &dat;
      yprd=T*&EstAte;
      keep ordr yprd;
    run;
    %return;
  %end;
  * prediction on test set;
  data dattr;
    set %scan(&fit,2,#);
  run;
  %let psvar=%scan(&fit,3,#);
  proc sql;
    select distinct T into :trts from &dat;
  quit;
