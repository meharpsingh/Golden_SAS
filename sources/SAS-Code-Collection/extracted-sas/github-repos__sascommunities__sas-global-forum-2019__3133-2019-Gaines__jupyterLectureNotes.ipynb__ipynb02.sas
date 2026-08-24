/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-global-forum-2019/3133-2019-Gaines/jupyterLectureNotes.ipynb (ipynb 2) */

/* Specify a random seed based on your birthday (MMDDYY format) */
%let bdaySeed = 010484;

proc ttest data=titanicTrainClean;
   class survived;
   var age;
   bootstrap / seed=&bdaySeed nsamples=10000 bootci=bc;
   ods select ConfLimits Bootstrap;
run;
