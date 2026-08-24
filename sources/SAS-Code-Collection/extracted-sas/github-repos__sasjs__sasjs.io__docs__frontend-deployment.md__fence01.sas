/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sasjs__sasjs.io/docs/frontend-deployment.md (fence 1) */

data _null_;
  length url $128;
  rc=METADATA_GETURI("Stored Process Web App",url);
  putlog 'Your SAS 9 url is: ' url;
run;
