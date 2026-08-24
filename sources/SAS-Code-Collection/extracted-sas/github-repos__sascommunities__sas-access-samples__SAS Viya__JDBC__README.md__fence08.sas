/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-access-samples/SAS Viya/JDBC/README.md (fence 8) */

data mylib.class;
set sashelp.class;
run;

proc sql;
select age **2 from mylib.class;
quit;

proc sql;
select distinct age **2 from mylib.class;
quit;
