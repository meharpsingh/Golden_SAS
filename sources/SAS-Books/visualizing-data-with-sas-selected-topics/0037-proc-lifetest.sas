proc lifetest data=sashelp.BMT plots=survival(cb=hw test atrisk(maxlen=13));
time T * Status(0);
strata Group;
run;
