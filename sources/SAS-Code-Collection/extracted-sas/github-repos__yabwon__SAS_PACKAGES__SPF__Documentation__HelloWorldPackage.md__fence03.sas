/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/yabwon__SAS_PACKAGES/SPF/Documentation/HelloWorldPackage.md (fence 3) */

/*** HELP START ***//*
 
 Macro has the following parameter(s):;
 
*//*** HELP END ***/

%macro HelloWorldMacro(n);
  data _null_;
    do i = 1 to &n.;
      put i HelloWorldFormat. @; 
    end;
  run;
%mend HelloWorldMacro;
