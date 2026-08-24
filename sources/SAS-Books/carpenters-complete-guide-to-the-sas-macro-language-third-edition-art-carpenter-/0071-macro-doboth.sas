%macro doboth(indata=,vlist=,cnt=10);
   %if &vlist ne %then %do; ➋
      proc sort data=&indata;
         by &vlist;
         run;
   %end;
   %else %put PROC SORT was not called;
   title1 "data set &indata";
   proc contents data=&indata;
      run;
   proc print data=&indata
   %if &cnt>1 %then %do; ➌
      (obs=&cnt);
      title2 "First &cnt Observations";
   %end;
   %else %do; ➍
      (obs=max);
      title2;
   %end;
      run;
%mend doboth;
