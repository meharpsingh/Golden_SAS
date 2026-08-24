%macro softmax(dsin=,var=,dsout=,log=L);
 proc sql;
   create table work.stats as
  select min(&var) as minv,
         max(&var) as maxv,
         mean(&var) as meanv,
         std(&var) as stdev
from &dsin
 ;
quit;
   data _null_ ;
     set work.stats;
    call symput('minv',minv);
    call symput('maxv',maxv);
    call symput('meanv',meanv);
    call symput('stdev',stdev);
   run;
%if %upcase(&log)=L %then
     %do;
        data &dsout;
     set &dsin;
      sm_&var = (&var - &minv)/(&maxv - &minv);
        run;
     %end;
 %else
   %if %upcase(&log)=S %then
       %do;
          data &dsout;
             set &dsin;
             %let var1 = (&var - &meanv)/(1.283 * (&stdev/6.2831853));
            sm_&var = 1/(1 + exp(- &var1));
          run;
       %end;
 %else
   %if %upcase(&log)=SS %then
       %do;
