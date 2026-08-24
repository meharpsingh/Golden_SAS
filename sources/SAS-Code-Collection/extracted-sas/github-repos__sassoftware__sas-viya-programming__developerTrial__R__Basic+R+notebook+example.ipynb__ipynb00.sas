/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-viya-programming/developerTrial/R/Basic+R+notebook+example.ipynb (ipynb 0) */

# Bring data locally;
df <- to.casDataFrame(castbl, obs = nrow(castbl))
