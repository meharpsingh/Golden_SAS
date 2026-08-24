data deviance_test;
 deviance = -2*(-91.1942 - (-67.2613));
  pvalue = 1 - probchi(deviance,7);
run;
proc print noobs;
run;
