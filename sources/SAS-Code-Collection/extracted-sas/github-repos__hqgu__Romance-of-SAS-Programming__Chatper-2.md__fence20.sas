/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/hqgu__Romance-of-SAS-Programming/Chatper-2.md (fence 20) */

data demoPDV;
input ID $ Chinese Math English;
Sum=Chinese+Math+English;
datalines;
S001 80 99 93
S002 90 85 95
S003 83 88 81
;
run;
