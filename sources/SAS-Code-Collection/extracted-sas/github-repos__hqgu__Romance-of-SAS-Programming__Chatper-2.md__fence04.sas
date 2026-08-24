/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/hqgu__Romance-of-SAS-Programming/Chatper-2.md (fence 4) */

data tmp;
date="01Jan1960"d;
time="00:00:00"t;
datetime="01Jan1960 00:00:00"dt;
run;
