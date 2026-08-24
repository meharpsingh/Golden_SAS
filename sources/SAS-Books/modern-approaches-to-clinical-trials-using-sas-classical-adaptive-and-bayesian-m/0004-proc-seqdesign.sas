proc seqdesign;
   Stage1_Fixed: design nstages=1 alt=twosided alpha=0.05;
   samplesize model=twosamplesurv(nullhazard=1.8 1.0 hazard=1.0);
run;
