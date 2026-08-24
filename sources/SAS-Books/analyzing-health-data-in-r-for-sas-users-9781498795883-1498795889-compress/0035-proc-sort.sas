proc sort data=r.BRFSS_a;
by SEX;
proc ttest data=r.BRFSS_a;
var SLEPTIM1;
by SEX;
run;
