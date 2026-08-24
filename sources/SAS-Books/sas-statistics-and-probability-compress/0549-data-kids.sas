data kids;
educ = 12;
exper = 10;
age = 35;
kidsl6 = 1;
kids618 = 1;
dp = probnorm(0.703693+0.113243*educ+0.073850
*exper-0.058856*age-0.867717*kidsl6+0.029130*kids618)
- probnorm(0.703693+0.113243*educ+0.073850
*exper-0.058856*age-0.867717*(kidsl6+1)+0.029130*kids618);
run;
proc print data=kids;
var dp;
title 'effect of additional small child on labor force participation';
run;
