/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/yabwon__SAS_PACKAGES/SPF/Documentation/LePetitSASpackage/le_petit_SAS_package.html (htmlpre 8) */

options dlcreatedir;
%let dir = R:\NJSUG\LePetitSASpackageDirectory;

libname p "&dir.";

libname p list;
