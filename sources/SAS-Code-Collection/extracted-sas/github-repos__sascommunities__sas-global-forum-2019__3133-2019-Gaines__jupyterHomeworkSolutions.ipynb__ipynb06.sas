/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-global-forum-2019/3133-2019-Gaines/jupyterHomeworkSolutions.ipynb (ipynb 6) */

proc sql;
run;
