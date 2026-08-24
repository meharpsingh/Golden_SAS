/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-access-samples/SAS Viya/JDBC/README.md (fence 1) */

proc delete data=mylib.airline;
run;
data mylib.airline; set sashelp.airline;
run;
