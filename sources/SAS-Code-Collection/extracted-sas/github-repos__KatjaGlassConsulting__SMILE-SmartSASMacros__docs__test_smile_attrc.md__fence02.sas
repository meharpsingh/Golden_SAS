/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/KatjaGlassConsulting__SMILE-SmartSASMacros/docs/test_smile_attrc.md (fence 2) */

DATA class(LABEL="SASHELP Example Dataset");
   SET sashelp.class;
RUN;
PROC SORT DATA=class; BY sex; RUN;
