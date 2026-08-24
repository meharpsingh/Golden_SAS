proc lifetest data=sashelp.BMT plots=survival(atrisk
(atrisktick maxlen=13 outside)=0 500 750 1000 1250 1500 1750 2000 2500);
time T * Status(0);
strata Group;
run;
