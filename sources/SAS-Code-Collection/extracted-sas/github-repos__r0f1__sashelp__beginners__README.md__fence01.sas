/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/r0f1__sashelp/beginners/README.md (fence 1) */

data _null_;
    put "Hello World!";
run;
