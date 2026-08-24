/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/yabwon__HoW-SASPackages/Share your code with SAS Packages - a Hands-on-Workshop.md (fence 8) */

/* enable a temporary version of the framework */
filename SPFinit url;
