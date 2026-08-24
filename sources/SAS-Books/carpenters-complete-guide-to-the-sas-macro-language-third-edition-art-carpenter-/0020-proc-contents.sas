%let dsn = IAX;
title "Looking at &dsn.protocol";
proc contents data= &dsn.protocol;
   run;
proc print data= &dsn.protocol;
   run;
