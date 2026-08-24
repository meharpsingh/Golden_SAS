%macro wildb;
  %do Biter=1 %to &Niter;
         title1 "**************************************** Biter=&Biter";
    ***Step 1: Generate random treatment (multinomial distribution);
    proc iml;
      use dpat(keep=ps_orig_:); read all into ps; close dpat;
      use dpat(keep=subjid); read all into subjid; close dpat;
      N=nrow(ps);
      w_star=J(N,1);
      call randseed(117*&Biter);
      do i=1 to N;
             *random treatment (multinomial distribution);
        w_star[i]=loc(randmultinomial(1,1,ps[i,])=1);
      end;
      create dwstar var{subjid,w_star};
      append;
      close dwstar;
    quit;
    *** Step 2: Obtain a new maximum likelihood estimator;
    data bdat;
      merge dpat dwstar(in=b);
      by subjid;
      cohort_star=put(w_star,cohort.);
    run;
    * fit the same logistic model for PS with the random treatment w_star as
      outcome;
    proc logistic data = bdat namelen=200;
      class cohort_star &pscat/param=ref;
      model cohort_star = &yeffects &pscat &pscnt
        /link=glogit include=&nyeff selection=stepwise sle=.20 sls=.20
hier=none;
      output out=bgps pred=ps_star;
    run;
    data bgps;
      set bgps;
      _leveln_=input(put(_level_,$cohort.),best.);
     run;
    * horizontal version of the new PS data: ps_star_1, ps_star_2, ... ;
    proc transpose data=bgps out=bgpst prefix=ps_star_;
      var ps_star;
      id _leveln_;
      by subjid;
    run;
              * ps_star is the PS for actual trt. w_star;
    data bdat;
      merge bdat bgpst;
      by subjid;
      drop _name_ _label_;
      array aps(*) ps_star_:;
      ps_star=aps(w_star);
    run;
    *** Step 2: Obtain Kw_star;
    * Kw_star is the counter which counts how many times the given record
      was used as a match for the setup with w_star and ps_star;
    %match_gps(ds=bdat
          ,id=subjid
          ,W=w_star
          ,ps=ps_star_
          ,y=&outc
          ,yout=dKw_star /* output ds with Kw */ );
    *** Step 3: nonparametric estimators of μ(w,p);
    * We restrict to individuals with  W=w, and regress the observed outcome
      against p(w|X);
    * We estimate the functional form of μ_hat(w,p) on the original data and
      keep it fixed;
    * In each bootstrap sample, we plug in the new propensity scores;
    * The regressor is only 1-dimensional. So, we can use kernel regression,
      power series regression or generalized additive model (GAM);
