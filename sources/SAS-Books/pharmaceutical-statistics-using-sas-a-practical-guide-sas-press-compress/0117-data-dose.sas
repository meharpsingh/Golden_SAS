data dose;
set dose;
retain reject 1;
format lower adjlower 5.2;
delta=0;
lower=mean2-mean1-tinv(0.95,n1+n2-2)*sqrt(1/n1+1/n2)*rootmse;
if reject=0 then adjlower=.;
if reject=1 and lower>delta then adjlower=delta;
if reject=1 and lower<=delta then do; adjlower=lower; reject=0; end;
label lower='Naive 95% lower limit'
adjlower='Adjusted 95% lower limit';
proc print data=dose noobs label;
var order dose lower adjlower;
ods listing;
run;
