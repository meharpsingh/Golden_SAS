%let dsn = clinics;
%let debug = /;
&debug* *;
proc contents data=&dsn;
title "Data Set &dsn";
   run;
proc print data=&dsn (obs=10);
   run;
*/ *;
When &DEBUG is null (blank or empty), a valid * style comment appears before and after the block of
code; otherwise, when &DEBUG is set to a slash (/), as is shown in Program 2.3e, the block of code
