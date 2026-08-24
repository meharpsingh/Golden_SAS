proc power;
   twosamplesurvival test=logrank
   groupmedsurvtimes=(6 8.25)
   accrualtime=12
   totaltime=24
   power=0.9
   alpha=0.025 sides=1
   ntotal=.;
run;
