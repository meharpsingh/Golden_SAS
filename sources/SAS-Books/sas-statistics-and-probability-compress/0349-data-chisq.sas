data chisq;
df = 1;
chi2_95 = cinv(.95,df);
chi2_99 = cinv(.99,df);
run;
proc print data=chisq;
title 'Chi-square critical values: one df';
run;
