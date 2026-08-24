proc power;
   twosamplemeans test=diff
   meandiff=0.02 stddev=0.045
   alpha=0.025, sides=1 power=0.9 ntotal=.;
run;
