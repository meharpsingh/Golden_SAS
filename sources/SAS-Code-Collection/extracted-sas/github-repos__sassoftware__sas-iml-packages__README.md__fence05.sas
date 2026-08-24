/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-iml-packages/README.md (fence 5) */

proc iml;
LOAD MODULE= _ALL_;
/* use the functions here */
quit;
