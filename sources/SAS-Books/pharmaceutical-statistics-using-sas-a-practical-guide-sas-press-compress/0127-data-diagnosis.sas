data diagnosis;
input patient depr pers schz neur othr @@;
datalines;
0 0 0 6 0 2
0 3 0 0 3 3
0 1 4 0 1 4
0 0 0 0 6 5
0 3 0 3 0
2 0 4 0 0 7
0 0 4 0 2 8
2 0 3 1 0 9
2 0 0 4 0 10 0 0 0 0 6
11 1 0 0 5 0 12 1 1 0 4 0 13 0 3 3 0 0 14 1 0 0 5 0 15 0 2 0 3 1
16 0 0 5 0 1 17 3 0 0 1 2 18 5 1 0 0 0 19 0 2 0 4 0 20 1 0 2 0 3
21 0 0 0 0 6 22 0 1 0 5 0 23 0 2 0 1 3 24 2 0 0 4 0 25 1 0 0 4 1
26 0 5 0 1 0 27 4 0 0 0 2 28 0 2 0 4 0 29 1 0 5 0 0 30 0 0 0 0 6
;
%let nr=6; * Number of raters;
data agreement;
set diagnosis nobs=m;
format pa pc kappa kappa_lower kappa_upper 5.3;
sm=depr+pers+schz+neur+othr;
sum0+depr; sum1+pers; sum2+schz; sum3+neur; sum4+othr;
pi=((depr**2)+(pers**2)+(schz**2)+(neur**2)+(othr**2)-sm)/(sm*(sm-1));
tot+((depr**2)+(pers**2)+(schz**2)+(neur**2)+(othr**2));
smtot+sm;
if _n_=m then do;
avgsum=smtot/m;
n=sum0+sum1+sum2+sum3+sum4;
pdepr=sum0/n; ppers=sum1/n; pschz=sum2/n; pneur=sum3/n; pothr=sum4/n;
* Percent agreement;
pa=(tot-(m*avgsum))/(m*avgsum*(avgsum-1));
* Expected agreement;
pc=(pdepr**2)+(ppers**2)+(pschz**2)+(pneur**2)+(pothr**2);
pc3=(pdepr**3)+(ppers**3)+(pschz**3)+(pneur**3)+(pothr**3);
* Kappa statistic;
kappa=(pa-pc)/(1-pc);
end;
* Variance of the kappa statistic;
kappa_var=(2/(n*&nr*(&nr-1)))*(pc-(2*&nr-3)*(pc**2)+2*(&nr-2)*pc3)/((1-pc)**2);
* 95% confidence limits for the kappa statistic;
kappa_lower=kappa-1.96*sqrt(kappa_var);
kappa_upper=kappa+1.96*sqrt(kappa_var);
label pa='Percent agreement'
pc='Expected agreement'
kappa='Kappa'
kappa_lower='Lower 95% confidence limit'
kappa_upper='Upper 95% confidence limit';
if _n_=m;
proc print data=agreement noobs label;
var pa pc;
proc print data=agreement noobs label;
var kappa kappa_lower kappa_upper;
run;
