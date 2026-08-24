proc lifetest data=sashelp.BMT plots=survival(strata=individual);
time T * Status(0);
strata Group;
run;
