/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sassoftware__sas-iml-packages/PROBMVN/README.md (fence 1) */

proc iml;
load module=_all_;     /* load the library */;

/* Example 1: Define limits and covariance matrix */
b = {1 4 2};
Sigma = {1.0 0.6 0.3333333333,
         0.6 1.0 0.7333333333,
         0.3333333333 0.7333333333 1.0 };
prob = cdfmvn(b, Sigma);
print prob;
QUIT;
