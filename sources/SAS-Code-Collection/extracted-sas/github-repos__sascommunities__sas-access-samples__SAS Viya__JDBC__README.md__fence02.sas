/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-access-samples/SAS Viya/JDBC/README.md (fence 2) */

proc delete data=mylib.class;
run;
data mylib.class; set sashelp.class;
run;
