/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/77QingLiu__SAS-Program-Library/%LOC2XPT Autocall Macro.md (fence 3) */

proc format;
   value testfmtnamethatislongerthaneight 
   100='numeric has been formatted'; 
run;
