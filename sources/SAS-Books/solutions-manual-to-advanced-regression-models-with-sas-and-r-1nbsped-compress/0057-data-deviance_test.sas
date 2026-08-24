data deviance_test;
 deviance = -2*(-81.2031 - (-69.3482));
 pvalue = 1 - probchi(deviance,3);
run;
