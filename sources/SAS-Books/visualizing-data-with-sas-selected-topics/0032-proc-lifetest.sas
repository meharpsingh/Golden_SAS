proc lifetest data=sashelp.BMT plots=survival(strata=panel);
time T * Status(0);
strata Group;
run;
