data _null_;
   name='Joe      ';
   call symput('name',name); ➊
   run;
%let sub = %substr(&name,1,4); ➋
%put |&sub|;
%let qsub = %qsubstr(&name,1,4); ➋
%put |&qsub|;
%let bqsub = %qsubstr(%bquote(&name),1,4); ➌
%put |&bqsub|;
