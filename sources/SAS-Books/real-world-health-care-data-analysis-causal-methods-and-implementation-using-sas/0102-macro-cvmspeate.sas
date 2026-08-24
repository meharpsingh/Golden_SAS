%macro CvmspeAte(tmthd,omthd,dat);
  %local mnam; %let mnam=&sysmacroname; %verbose(&mnam &tmthd &omthd &dat);
  %local i bins bin wts_trn wts_all atetri ate nmwts;
  * distinct bins on dat;
  proc sql;
    select distinct(binN) into :bins separated by ' ' from &dat;
  quit;
  * add PS variables;
  data dall;
    merge &dat dpss;
    by ordr;
  run;
  * will use dat1 for predicting potential outcome if treated;
  data dat1;
    set dall;
    Torig=T;
    T=1;
  run;
  * will use dat0 for predicting potential outcome if control;
  data dat0;
    set dall;
    Torig=T;
    T=0;
  run;
  * for each combination of training bins and hold-out bin;
  data mspes; delete; run; * place for bin specific MSPE;
  %do i=1 %to %sysfunc(countw(&bins));
    %let bin=%scan(&bins,&i);
    * training bins;
    data dtrn;
      set dall;
      where binN~=&bin;
    run;
    * hold-out bin;
    data dtst;
      set dall;
      where binN=&bin;
    run;
    * fit Outcome model on training bins;
    %let wts_trn=ipw%substr(&tmthd,3)_&i; * name of ipw variable;
    * check if weights are not missing (they will be missing if the PS model fails);
    proc sql; select count(*) into :nmwts from dtrn where &wts_trn>.; quit;
    %if &nmwts>0 %then %do;
      * non missing weights;
      %let fit=;
      %fit_&omthd(dtrn,&wts_trn); * fit outcome model on training data;
      * get ATE on training bins;
      %prd_&omthd(dat1(where=(binN~=&bin)),dout=prditr1);
      %prd_&omthd(dat0(where=(binN~=&bin)),dout=prditr0);
      proc sql;
        select mean(a.yprd-b.yprd) into :atetri from prditr1 a join prditr0 b on
            a.ordr=b.ordr;
      quit;
      * get prediction of potential outcome on hold-out bin;
      * potential outcome will be calculated as mixture of the indirect
              prediction via ATE and the direct prediction;
      * the qw is the mixing factor, for treated;
      %prd_&omthd(dat0(where=(binN=&bin and Torig=1)),dout=prdite10);
      * will be used for indirect prediction via ATE;
      %prd_&omthd(dat1(where=(binN=&bin and Torig=1)),dout=prdite11);
      * will be used for direct prediction;
      *  for controls;
      %prd_&omthd(dat1(where=(binN=&bin and Torig=0)),dout=prdite01);
      * will be used for indirect prediction via ATE;
      %prd_&omthd(dat0(where=(binN=&bin and Torig=0)),dout=prdite00);
      * will be used for direct prediction;
      * get MSPE;
      proc sql;
        * potential outcome for treated on training bin;
        * combination of (ATE + counterfactual if not treated) and (direct prediction
          on treated);
        create table prdite1 as
          select a.ordr, &qw*(a.yprd+&atetri) + (1-&qw)*b.yprd as yprd
          from prdite10 a join prdite11 b on a.ordr=b.ordr;
        * potential outcome for controls on training bin;
        * combination of (-ATE + counterfactual if treated) and (direct prediction on
          not treated);
        create table prdite0 as
          select a.ordr, &qw*(a.yprd-&atetri) + (1-&qw)*b.yprd as yprd
          from prdite01 a join prdite00 b on a.ordr=b.ordr;
      quit;
      data yprdy;
        merge dall(where=(binN=&bin) keep=ordr Y binN)
          prdite1(keep=ordr yprd)
          prdite0(keep=ordr yprd)
        ;
        by ordr;
      run;
      * calculate the MSPE on hold-out bin;
      proc sql;
        create table mspei as
          select distinct binN,mean((Y-yprd)**2) as mspe
          from yprdy
        ;
      quit;
    %end; %else %do;
      *missing weights;
      data mspei;
        binN=&bin;
        mspe=.;
      run;
    %end;
    data mspes;
      set mspes mspei;
    run;
  %end;
  * fit Outcome model on all data;
  %let wts_all=ipw%substr(&tmthd,3)_all;
  * check if weights are not missing;
  proc sql; select count(*) into :nmwts from dall where &wts_all>.; quit;
  %if &nmwts>0 %then %do;
    * non missing weights;
    %let fit=;
    %fit_&omthd(dall,&wts_all);
    * get ATE on all data;
    %prd_&omthd(dat1,dout=prd1);
    %prd_&omthd(dat0,dout=prd0);
    proc sql;
      select mean(a.yprd-b.yprd) into :ate from prd1 a join prd0 b on a.ordr=b.ordr;
    quit;
  %end; %else %do;
    *missing weights;
    %let ate=.;
  %end;
  * MSPEs for all hold-out bins;
  proc transpose data=mspes out=mspest prefix=mspe;
    id binN;
  run;
  * add results to FINAL dataset;
  data fma_final_chg;
    length method $99 booN 8;
    set fma_final_chg(in=a) mspest(drop=_name_);
    if a then return;
    method="&tmthd._&omthd";
    booN=&booN;
    CvMSPE=mean(of mspe:);
    Sigma2Hat=&Sigma2Hat;
    FMAwgt=exp(-CvMSPE/&Sigma2Hat);
    ATE=&ate;
  run;
%mend CvmspeAte;
***************************************************************;
