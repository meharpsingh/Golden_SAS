proc lifetest data=sashelp.BMT plots=survival(atrisk
(atrisktickonly maxlen=13 outside)=0 1250 2500);
time T * Status(0);
strata Group;
run;
