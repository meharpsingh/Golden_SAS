/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-global-forum-2020/papers/4157-2020-Toporowski/Python and the SAS QKB for Better Data Quality.ipynb (ipynb 0) */

# Create a connection to CAS, specifying host name or url
run;
