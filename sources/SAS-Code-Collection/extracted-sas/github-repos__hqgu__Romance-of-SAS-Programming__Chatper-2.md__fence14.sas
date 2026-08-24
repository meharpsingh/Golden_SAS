/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/hqgu__Romance-of-SAS-Programming/Chatper-2.md (fence 14) */

data tmp;
*===定义数组;
array sbp{7} sbp1-sbp7 (163 164 167 171 155 158 154);
array dbp{7} dbp1-dbp7 (98 99 92 94 95 93 93);
array bp{2,7} sbp1-sbp7 dbp1-dbp7 (163 164 167 171 155 158 154 98 99
92 94 95 93 93);
*===遍历一维数组;
do i=1 to 7;
put "第" i "次测量的SBP为： " sbp{i};
put "第" i "次测量的DBP为： " dbp{i};
end;
*===遍历二维数组;
do m=1 to 2;
do n=1 to 7;
put "血压类型为： " m "，血压测量次数为： " n "，血压测量值为： " bp{m,n};
end;
end;
run;
