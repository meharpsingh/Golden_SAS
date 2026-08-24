%let dsn = IAX;
title "Looking at the &dsn data";
proc contents data= &dsn;
   run;
proc print data= &dsn;
   run;
