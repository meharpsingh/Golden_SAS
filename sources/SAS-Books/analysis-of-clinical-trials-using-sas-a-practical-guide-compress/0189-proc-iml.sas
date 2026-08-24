proc iml;
use &data;
read all var {n teststat} into data;
m=nrow(data);
n=data[,1];
teststat=data[,2];
prob=j(m,4,0);
prob[,1]=t(1:m);
prob[,2]=n/&nn;
prob[,3]=teststat;
prob[,4]=1-probnorm((sqrt(&nn)*probit(1-&alpha)-sqrt(n)#teststat
-(&nn-n)*&effsize/sqrt(2))/sqrt(&nn-n));
varnames={"Analysis" "Fraction" "TestStat" "CondPower"};
Appendix
create &prob from prob[colname=varnames];
append from prob;
bound=j(50,2,0);
frac=(1:50)*&nn/50;
bound[,1]=t(frac/&nn);
bound[,2]=t(sqrt(&nn/frac)*probit(1-&alpha)+sqrt((&nn-frac)/frac)
*probit(1-&gamma)-&effsize*(&nn-frac)/sqrt(2*frac));
varnames={"Fraction" "StopBoundary"};
create &boundary from bound[colname=varnames];
append from bound;
quit;
data &prob;
set &prob;
format Fraction 4.2 TestStat 7.4 CondPower 6.4;
label Fraction="Fraction of total sample size"
TestStat="Test statistic"
CondPower="Conditional power";
%mend CondPowerLSH;
%CondPowerPAB Macro: Pepe-Anderson-Betensky Conditional Power
Test
