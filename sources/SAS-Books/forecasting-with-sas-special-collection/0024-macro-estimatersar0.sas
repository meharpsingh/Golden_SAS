   %macro estimateRSAR0(kStart, kEnd, qMultiStart);
      %let p = 0;
      %do k = &kStart. %to &kEnd.;
         proc hmm data=cashmm.sp500wIn(where=(date>=&&w&p.))
                  outstat=cashmm.sp500StatIn_k&k._p&p.;
            id time=date;
            model returnw / type=ar nstate=&k. ylag=&p. method=map;
            optimize printLevel=3 printIterFreq=1 algorithm=interiorpoint
               multistart=&qMultiStart.;
            score outmodel=cashmm.sp500ModelIn&k._&p.;
            prior tpm~dir(J(&k.,&k.,1)),
               musigma~niw(J(&k.,1+&p.,0),J(&k.,1,10),
                           J(&k.,1,0.00001)@I(1+&p.),J(&k.,1,4.00001));
         run;
         data sp500StatIn_p&p._k&k.;
            set cashmm.sp500StatIn_k&k._p&p.;
            nStates=&k.; lag=&p.;
            keep nStates lag logLikelihood AIC AICC BIC HQC;
         run;
      %end;
      data sp500SelectModelIn_p&p.;
         set sp500StatIn_p&p._k&kStart. - sp500StatIn_p&p._k&kEnd.;
      run;
   %mend estimateRSAR0;
   * estimate k-state RS-AR(0), k from 2 to 10, with multistart mode on;
   * be aware that the following macro might take tens of hours to finish;
   * uncomment it to run;
   * even if you do not run this macro here, later you still have a chance to get
   * estimates of RS-AR(0) models;
   * %estimateRSAR0(kStart=2, kEnd=10, qMultiStart=1);
