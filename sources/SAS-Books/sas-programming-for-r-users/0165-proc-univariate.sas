proc univariate data=sp4r.ameshousing;
var gr_liv_area;
histogram gr_liv_area / normal kernel;
qqplot gr_liv_area / normal(mu=est sigma=est);
output out=gr_percs pctlpts= 40 to 60 by 2
pctlpre=gr_liv_area_;
run;
proc print data=gr_percs;
run;
