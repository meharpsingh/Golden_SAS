/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/hqgu__Romance-of-SAS-Programming/Chatper-2.md (fence 19) */

*===定义Macro;
*===通过data和var这两个参数指定数据集和变量;
%macro prtdsvar(data=, var=);
proc print data=&data;
  var &var;
run;
%mend;

*===调用Macro;
%prtdsvar(data=sashelp.class, var=name sex);
