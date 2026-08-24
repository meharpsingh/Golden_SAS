/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/hqgu__Romance-of-SAS-Programming/Chatper-2.md (fence 29) */

*=== 数据列数=变量数;
data test1;
input id x y z;
datalines;
1 98 99 97
2 93 91 92
;
run;

*=== 数据列数=变量数，多个input 语句;
data test2;
input id@;
input x@;
input y@;
input z@;
datalines;
1 98 99 97
2 93 91 92
;
run;

*=== 数据列数=k*变量数;
data test3;
input id x y z @@;
datalines;
1 98 99 97 2 93 91 92
;
run;
