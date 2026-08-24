ods listing close;
ods output CrossTabFreqs=SexVetFreq;
proc freq data=r. BRFSS_a;
tables SEX*VETERAN3;
run;
