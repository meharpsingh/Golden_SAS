/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__ci360-extensions/ci360-custom-development-standards/SAS-CI360-Guidelines-STP.md (fence 5) */

filename code temp;

data _null_;
  set sashelp.class;
  file code;
  put '%mean_height_by_age(age=' age ',loop=' _n_ ');';
run;
