/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sasjs__core/README.md (fence 2) */

/* compile the lua module */
%ml_yourmodule();

/* Execute.  Do not use the restart keyword! */
proc lua;
submit;
