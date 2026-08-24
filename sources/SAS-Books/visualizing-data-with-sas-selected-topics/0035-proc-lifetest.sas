proc lifetest data=sashelp.BMT plots=survival(cb=all test);
time T * Status(0);
strata Group;
run;
