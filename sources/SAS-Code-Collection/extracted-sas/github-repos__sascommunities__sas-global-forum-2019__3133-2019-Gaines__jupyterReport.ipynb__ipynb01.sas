/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-global-forum-2019/3133-2019-Gaines/jupyterReport.ipynb (ipynb 1) */

data titanicTrainClean;
    set titanicTrainClean;
    famSize = parch + sibsp + 1;
run;

data titanicTestClean;
    set titanicTestClean;
    famSize = parch + sibsp + 1;
run;
