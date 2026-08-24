proc seqdesign altref=0.02 errspend stopprob;
   hpdesignforfh: design nstages=5 method=peto(z=3) alt=upper stop=reject
   alpha=0.025 beta=0.1;
   samplesize model=twosamplemean (stddev=0.045);
run;
