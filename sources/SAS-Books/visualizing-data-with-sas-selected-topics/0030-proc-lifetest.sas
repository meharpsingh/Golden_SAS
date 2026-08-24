proc lifetest data=sashelp.BMT plots=survival;
time T * Status(0);
strata Group;
run;
