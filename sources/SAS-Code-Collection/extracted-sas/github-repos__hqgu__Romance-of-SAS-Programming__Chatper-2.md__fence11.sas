/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/hqgu__Romance-of-SAS-Programming/Chatper-2.md (fence 11) */

data schedule;
do date='01Sep2016'd to '30Sep2016'd ; *日期循环;
day=weekday(date);
if day in (1,7) then Activity="Running";
else if day in (2,4,6) then Activity="Writing";
else Activity="Reading";
output;
end;
run;
data random;
do i=1 to 10; *数字10次循环;
r=rannor(23); *生成随机数;
output;
end;
