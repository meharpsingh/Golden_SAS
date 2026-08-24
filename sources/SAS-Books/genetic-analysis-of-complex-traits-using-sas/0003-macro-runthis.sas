%macro runthis(dataset,treat,percent=.50);
%let percent1=%sysevalf(1-&percent);
proc freq data=&dataset; weight count; by experiment;
 tables &treat /testp=(&percent &percent1);
run;
%mend;
