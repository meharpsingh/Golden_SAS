/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-viya-programming/developerTrial/SAS/Basic+SAS+Example.ipynb (ipynb 2) */

filename hmeq url 'http://support.sas.com/documentation/onlinedoc/viya/exampledatasets/hmeq.csv'; 
libname mycas cas;
proc import file=hmeq out=mycas.hmeq dbms=csv;
run;
