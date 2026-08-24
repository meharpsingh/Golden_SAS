%macro regions;
%local i;
proc sql noprint;
   select distinct origin
      into :orig1-
         from sashelp.cars;
   quit;
%do i = 1 %to &sqlobs;
