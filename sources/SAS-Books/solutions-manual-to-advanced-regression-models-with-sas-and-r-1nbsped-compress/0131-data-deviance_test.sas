data deviance_test;
 deviance = -2*(-43.0673 - (-29.4951));
 pvalue = 1 - probchi(deviance,2);
run;
proc print noobs;
run;
