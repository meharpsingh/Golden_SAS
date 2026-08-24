%macro look(dsn);
%local maxn;
* Determine the next available title;
proc sql noprint; ➊
   select max(number) ➋
      into :maxn ➌
         from sashelp.vtitle ➍
            where type='T'; ➎
   quit;
title%eval(&maxn+1) ➏ "Listing of &dsn";
proc print data=&dsn;
   run;
title%eval(&maxn+1); ➐
%mend look;
