data AIC;
set ic1 ic2;
run;
proc print data=AIC;
id Model Covariance;
var Parms Neg2LogLike AIC AICC HQIC BIC;
run;
