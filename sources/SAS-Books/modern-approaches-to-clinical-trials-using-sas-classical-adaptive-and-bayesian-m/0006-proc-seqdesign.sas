ods graphics on;
proc seqdesign pss stopprob errspend;
   pocdesignforfh: design nstages=4 method=poc alt=upper alpha=0.025;
   obfdesignforfh: design nstages=4 method=obf alt=upper alpha=0.025;
   samplesize model=twosamplemean (stddev=0.045 meandiff=0.02 weight=1);
run;
