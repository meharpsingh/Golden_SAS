%let cont_var = saleprice garage_area basement_area gr_liv_area;
ods select pearsoncorr;
proc corr data=sp4r.ameshousing;
var cont_var;
run;
proc means data=sp4r.ameshousing;
var cont_var;
run;
