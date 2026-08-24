proc lifetest data=sashelp.BMT plots=survival(cb=hw test);
time T * Status(0);
strata Group;
run;
