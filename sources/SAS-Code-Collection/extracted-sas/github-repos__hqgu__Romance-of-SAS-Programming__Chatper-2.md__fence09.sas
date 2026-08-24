/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/hqgu__Romance-of-SAS-Programming/Chatper-2.md (fence 9) */

data male female;
set sashelp.class;
if sex="M" then output male;
else if sex="F" then output female;
else put "Invalid sex :" sex ;
run;
