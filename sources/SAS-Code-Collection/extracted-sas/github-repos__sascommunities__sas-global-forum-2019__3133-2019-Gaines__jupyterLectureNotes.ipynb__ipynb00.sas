/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-global-forum-2019/3133-2019-Gaines/jupyterLectureNotes.ipynb (ipynb 0) */

/* Reduce log output */
options nosource nonotes;
/* Fetch the file from the website */
filename titanic temp;
proc http;
    method="GET"
    out=titanic;
run;
/* Import the file */
proc import;
    file=titanic
    out=work.titanicTrainClean replace
    dbms=csv;
run;
