proc lifetest data=sashelp.BMT plots=survival(cb=ep test);
time T * Status(0);
strata Group;
run;
