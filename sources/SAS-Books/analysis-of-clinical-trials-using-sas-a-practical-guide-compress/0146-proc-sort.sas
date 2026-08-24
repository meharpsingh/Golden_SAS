proc sort data=growthmi;
by sex;
proc print data=growthmi;
title "Horizontal data set";
run;
