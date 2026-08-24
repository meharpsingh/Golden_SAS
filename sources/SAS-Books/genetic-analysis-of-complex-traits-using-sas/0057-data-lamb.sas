data lamb;
input weight 1-5 age 7;
datalines;
4.44  0
4.86  1
6.44  2
8.14  3
9.88  4
11.40 5
12.78 6
13.14 7
14.86 8
;
run;
data lamb;
set lamb;
weight1=weight-4.44;
run;
proc nlin data=lamb;
model weight1=w0*exp(m*(1-exp(-D*age))/D);
parms w0=0 m=0.5 D=0.10;
output out=Gompertz predicted=p;
run;
symbol1 interpol=join value=none color=black;
symbol2 interpol=none value=star color=black;
proc gplot data=gompertz;
plot p*age weight1*age/overlay;
run;
quit;
run;
