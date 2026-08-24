proc means data=sp4r.ameshousing;
var saleprice;
output out=stats median=sp_med;
run;
data _null_;
set stats;
call symputx('med',sp_med);
run;
%put The median of the Sale Price variable is &med;
