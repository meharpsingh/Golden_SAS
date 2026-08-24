ods output CrossTabFreqs = AlcFreq;
ods trace on;
proc freq data=r.analytic;
        tables ALCGRP*ASTHMA4;
run;
ods output close;
PROC EXPORT DATA= WORK.ALCFREQ
 OUTFILE= "C:\Users\Monika\Dropbox\R Stats
Book\Analytics\Data\AlcFreq_sas.csv"
DBMS=CSV REPLACE;
PUTNAMES=YES;
