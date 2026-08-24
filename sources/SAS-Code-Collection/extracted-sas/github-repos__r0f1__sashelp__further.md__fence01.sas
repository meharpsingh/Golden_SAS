/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/r0f1__sashelp/further.md (fence 1) */

* delete all labels and formats from a dataset ;
proc datasets nolist;
    modify alldat;
    attrib _all_ label='';
    attrib _all_ format=;
    attrib _all_ informat=;
run;
