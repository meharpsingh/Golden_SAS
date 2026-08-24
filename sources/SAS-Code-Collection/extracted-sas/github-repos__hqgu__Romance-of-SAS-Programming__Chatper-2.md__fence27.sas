/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/hqgu__Romance-of-SAS-Programming/Chatper-2.md (fence 27) */

data demoPDV;
put "第" _n_ "次运行前： " _all_;
input ID $ Chinese Math English;
Sum=Chinese+Math+English;
put "第" _n_ "次运行后： " _all_;
datalines;
S001 80 99 93
S002 90 85 95
S003 83 88 81
;
run;
