/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;
%let repopath=sashelp.class;

/* Extracted from github-repos/sascommunities__sas-microsoft-graph-api/README.md (fence 4) */

/* Run just once in your session */
options dlcreatedir;
%let repopath=%sysfunc(getoption(WORK))/sas-microsoft-graph-api;
libname repo "&repopath.";
data _null_;
    rc = git_clone( 
      "https://github.com/sascommunities/sas-microsoft-graph-api", 
      "&repoPath." 
    			); 
    put 'Git repo cloned ' rc=; 
run;
%include "&repopath./ms-graph-macros.sas";
