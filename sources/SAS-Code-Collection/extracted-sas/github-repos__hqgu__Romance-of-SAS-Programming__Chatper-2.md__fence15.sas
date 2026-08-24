/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/hqgu__Romance-of-SAS-Programming/Chatper-2.md (fence 15) */

data _null_;
length FullName_ByFunction FullName_ByRoutine $10;
FamilyName="Gu";
GivenName="Hongqiu";
*===用函数生成全名;
FullName_ByFunction=catx(" ",GivenName, FamilyName);
*===用列程生成全名;
call catx(" ",FullName_ByRoutine, GivenName, FamilyName );
*===Log中查看结果;
put "Fullname Generatedy by Function: " FullName_ByFunction;
put "Fullname Generatedy by Routine: " FullName_ByRoutine;
run;
