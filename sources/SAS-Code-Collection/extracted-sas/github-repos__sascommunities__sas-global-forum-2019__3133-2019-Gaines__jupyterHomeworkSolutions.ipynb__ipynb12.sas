/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-global-forum-2019/3133-2019-Gaines/jupyterHomeworkSolutions.ipynb (ipynb 12) */

/* Handle missing values for the training data */
proc sql;
    create table titanicTrainClean as;
    select coalesce(age, median(age)) as age, * from titanicTrain(drop=cabin embarked boat body home_dest);
    where fare IS NOT MISSING;
    group by sex, pclass;
quit;
/* Handle missing values for the test data */
proc sql;
    create table titanicTestClean as;
    select coalesce(age, median(age)) as age, * from titanicTest(drop=cabin embarked boat body home_dest);
    where fare IS NOT MISSING;
    group by sex, pclass;
quit;
