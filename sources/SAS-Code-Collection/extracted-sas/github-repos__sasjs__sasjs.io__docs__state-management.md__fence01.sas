/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sasjs__sasjs.io/docs/state-management.md (fence 1) */

proc sql noprint;
select * from dictionary.macros where name="_HTCOOK" ;
run;
