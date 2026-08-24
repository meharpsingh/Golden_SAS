/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/77QingLiu__SAS-Program-Library/2-SAS Learning/0-Macro/Lilly/macros/AHG/newsas/meta/googlelike.txt (txt 1) */

AHG1     proc means data=sashelp.class;
AHG1     	var age;
AHG1     run;


  
AHG2     proc freq data=sashelp.class;
AHG2       table age;
AHG2     run;
