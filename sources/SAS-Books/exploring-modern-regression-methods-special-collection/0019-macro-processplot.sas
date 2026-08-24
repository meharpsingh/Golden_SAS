%MACRO ProcessPlot(Parm=);
data ParmEst; set Estimates;
if Parameter EQ "&Parm";
run;
title "Quantile Regression Coefficients for &Parm";
proc sgplot data=ParmEst noautolegend;
band
x=quantile lower=LowerCL
upper=UpperCL / transparency=0.5;
series x=quantile y=estimate ;
refline 0 / axis=y lineattrs=(thickness=2px);
yaxis label='Parameter Estimate and 95% Confidence Limits'
grid gridattrs=(thickness=1px color=gray pattern=dot);
xaxis label='Quantile Level';
run;
%MEND ProcessPlot;
