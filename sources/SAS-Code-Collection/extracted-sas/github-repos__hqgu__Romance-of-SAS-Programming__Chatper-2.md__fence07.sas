/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/hqgu__Romance-of-SAS-Programming/Chatper-2.md (fence 7) */

*===常量;
data _null_;
*==字符常量;
c1="Hongqiu Gu's Book";
c2='Hongqiu Gu''s Book';
c3='Hongqiu Gu"s Book';
c4="Hongqiu Gu""s Book";
*==数字常量;
n1=123;
n2=-123;
n3=+123;
n4=1.23;
n5=0123;
*===日期时间常量;
d='08Sep2016'D;
t='11:11'T;
dt='08Sep2016:11:11'DT;
*===在日志中输出;
put c1-c4 ;
put n1-n5 ;
put d yymmdd10.;
put t time.;
put dt datetime.;
run;
