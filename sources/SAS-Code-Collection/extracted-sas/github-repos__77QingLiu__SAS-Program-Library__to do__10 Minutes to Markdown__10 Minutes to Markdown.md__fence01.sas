/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/77QingLiu__SAS-Program-Library/to do/10 Minutes to Markdown/10 Minutes to Markdown.md (fence 1) */

data air;
      set sashelp.air;
  run;
  proc print data=air;
  run;
