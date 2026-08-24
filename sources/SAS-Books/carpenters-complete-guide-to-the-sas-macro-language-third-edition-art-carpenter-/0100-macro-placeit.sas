%macro placeit(val=); ➏
data _null_;
string="&val";
call symput('c1',string); ➐
call symputx('c2',string); ➐
call symputx('c3',string,'f'); ➐
call symputx('c4',string,'g'); ➑
call symputx('c5',string,'l'); ➒
run;
%put _user_;
%mend placeit;
%let c3=inglobal; ➎
