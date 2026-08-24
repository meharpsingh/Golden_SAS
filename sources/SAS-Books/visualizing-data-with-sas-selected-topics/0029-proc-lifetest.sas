ods graphics on;
proc lifetest data=sashelp.BMT;
time T * Status(0);
strata Group;
run;
