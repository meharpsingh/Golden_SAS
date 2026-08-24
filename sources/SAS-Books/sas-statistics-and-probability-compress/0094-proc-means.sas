proc means data=parm mean var std min max p1 p99;
var b1 b2 sig2;
title 'Monte Carlo summary statistics';
run;
