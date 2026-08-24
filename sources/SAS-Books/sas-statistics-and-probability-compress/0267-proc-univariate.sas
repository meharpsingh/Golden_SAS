proc univariate data = parm;
var b2;
histogram/normal;
title 'Sampling distribution of OLS b2';
title2 'Errors heteroskedastic';
run;
