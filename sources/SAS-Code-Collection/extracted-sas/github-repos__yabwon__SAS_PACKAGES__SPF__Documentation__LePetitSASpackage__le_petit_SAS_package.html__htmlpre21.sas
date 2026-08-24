/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/yabwon__SAS_PACKAGES/SPF/Documentation/LePetitSASpackage/le_petit_SAS_package.html (htmlpre 21) */

/* 99_test -> test_fail_e1w0.sas */
filename f "&dir.\99_test\test_fail_e1w0.sas";
data _null_;
  file f;
  infile CARDS4;
  input;
  put _infile_;
CARDS4;
data _null_;
  put "Testing format (should print error):";
  do i = 5;
    put i rose. /;
  end;
run;
;;;;
run;
