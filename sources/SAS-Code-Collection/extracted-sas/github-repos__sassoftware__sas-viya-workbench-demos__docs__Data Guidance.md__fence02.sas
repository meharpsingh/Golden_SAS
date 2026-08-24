/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-viya-workbench-demos/docs/Data Guidance.md (fence 2) */

data WORK.HMEQ;
      set SAMPSIO.HMEQ;
      run;
