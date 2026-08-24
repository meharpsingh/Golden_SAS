proc means data=macro3.clinics noprint;
var ht wt;
output out=stats mean= max= / autoname;
run;
