%macro engchng(libref=sasuser,
               engine=v6,
               dsn=);
* libref - library containing the data set(s) of interest
* engine - output engine for this &dsn
* dsn    - name of data set to copy
*;
* Create a libref for the stated Engine;
libname dbmsout clear;
libname dbmsout &engine "%sysfunc(pathname(&libref))"; ➊
* Copy the SAS data set(s) using the alternate engine;
proc datasets nolist; ➋
  copy in=&libref out=dbmsout;
    select &dsn;
  run;
  quit;
libname dbmsout clear;
%mend engchng;
***************************************************;
