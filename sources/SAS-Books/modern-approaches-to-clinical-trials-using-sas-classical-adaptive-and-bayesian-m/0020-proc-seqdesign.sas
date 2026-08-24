proc seqdesign altref=0.15;
   OneSidedFixedSample: design nstages=1
   alt=upper alpha=0.025 beta=0.10;
   samplesize model=twosamplefreq(nullprop=0.15 test=prop);
run;
