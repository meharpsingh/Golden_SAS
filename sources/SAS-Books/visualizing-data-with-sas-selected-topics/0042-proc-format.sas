proc format;
invalue bmtnum
'AML-Low Risk' = 1
'ALL' = 2
'AML-High Risk' = 3;
value
bmtfmt
1 = 'AML-Low Risk'
2 = 'ALL'
3 = 'AML-High Risk';
run;
data BMT(drop=g);
set sashelp.BMT(rename=(group=g));
Group = input(g, bmtnum.);
run;
proc lifetest data=BMT plots=survival(cl test atrisk(maxlen=13));
time T * Status(0);
strata Group / order=internal;
format group bmtfmt.;
run;
