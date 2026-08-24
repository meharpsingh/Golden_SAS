/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-access-samples/SAS Viya/JDBC/README.md (fence 6) */

proc sql;
insert into mylib.class (name) values ('ted');
quit;
proc delete data=mylib.class2 mylib.class;
run;
