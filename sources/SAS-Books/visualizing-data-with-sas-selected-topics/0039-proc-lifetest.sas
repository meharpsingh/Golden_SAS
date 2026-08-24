proc lifetest data=sashelp.BMT
plots=survival(atrisk(maxlen=13 outside)=0 to 3000 by 1000);
time T * Status(0);
strata Group;
run;
