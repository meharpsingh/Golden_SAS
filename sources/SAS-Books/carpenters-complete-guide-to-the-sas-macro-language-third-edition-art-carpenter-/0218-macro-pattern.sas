%macro pattern(dsn=,pievar=);
%local g i j nslice;
* Determine the number of unique values of the
* variable that will be used to determine the slices;
proc sql noprint;
select count(distinct &pievar) into :nslice ➌
   from &dsn;
   run;
%do j = 1 %to &nslice;
   %* Create &nslice pattern statements;
   %let i=%sysevalf(255/(&nslice+1)*&j,floor); ➍
   %let g=%sysfunc(putn(&i,hex2.)); ➎
   pattern&j v=psolid c=gray&g r=1;  ➏
%end;
%mend pattern;
