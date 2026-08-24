%let conf=%sysevalf(100*(1-&alpha));
data &inference;
set &inference;
length par $50;
format value best6.;
if _n_=1 then par="Median unbiased estimate"; value=col1;
if _n_=2 then par="Lower &conf.% confidence limit"; value=col1;
label par='Parameter' value='Value';
keep par value;
data &decision;
set &decision;
format TestStatistic PValue UpperTestStBoundary LowerTestStBoundary
UpperPValBoundary LowerPValBoundary LowerLimit Fraction 6.4 Analysis Size 4.0;
