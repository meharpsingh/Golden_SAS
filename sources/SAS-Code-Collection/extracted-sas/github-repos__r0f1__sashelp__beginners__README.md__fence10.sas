/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/r0f1__sashelp/beginners/README.md (fence 10) */

data alldat;
    agecat=.; * <-- this statement is important *;
    if       0<=age<10 then agecat=1;
    else if 10<=age<20 then agecat=2;
run;
