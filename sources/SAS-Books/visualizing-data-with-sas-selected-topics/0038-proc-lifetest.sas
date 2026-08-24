proc lifetest data=sashelp.BMT
plots=survival(atrisk(maxlen=13 outside(0.15)));
time T * Status(0);
strata Group;
run;
