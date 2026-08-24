proc power;
   twosamplefreq test=fisher
   groupproportions=(0.4 0.07) groupns=(50 25)
   alpha=0.025 sides=1 power=.;
run;
