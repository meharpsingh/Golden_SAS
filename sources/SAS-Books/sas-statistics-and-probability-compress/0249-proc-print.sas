proc print data=gqtest(obs=1);
var sig2m sig2r GQ f975 f025;
title 'GQ test two tail';
run;
