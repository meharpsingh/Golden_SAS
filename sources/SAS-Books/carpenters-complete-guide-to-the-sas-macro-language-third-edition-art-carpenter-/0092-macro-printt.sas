%macro printt(dsin,proc=);
     proc &proc data=&dsin;
     run;
%mend printt;
