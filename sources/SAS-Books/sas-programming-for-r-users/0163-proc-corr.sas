ods select pearsoncorr;
proc corr data=sp4r.ameshousing;
     var saleprice garage_area basement_area gr_liv_area;
run;
