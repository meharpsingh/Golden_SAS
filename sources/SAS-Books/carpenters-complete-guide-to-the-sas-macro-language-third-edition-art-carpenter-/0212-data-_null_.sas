data _null_;
date = put("&sysdate9"d,worddate18.);
call symputx('newdt',date);
run;
%put &=newdt;
