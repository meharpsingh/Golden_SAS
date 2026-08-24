/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-global-forum-2021/papers/1151-2021-Amrhein/SASGF2021-Proceedings-Paper-Template.ipynb (ipynb 1) */

proc ds2;
data _null_; 
  method init(); 
    dcl varchar(16) str; 
    str = 'Hello World!'; 
    put str; 
  end;
enddata;
run;
quit;
