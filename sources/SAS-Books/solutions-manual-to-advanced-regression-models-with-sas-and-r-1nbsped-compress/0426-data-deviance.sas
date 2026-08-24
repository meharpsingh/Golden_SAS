data deviance;
 deviance = 450.08 - 427.95;
 pvalue = 1 - probchi(deviance, 1);
run;
proc print noobs;
run;
