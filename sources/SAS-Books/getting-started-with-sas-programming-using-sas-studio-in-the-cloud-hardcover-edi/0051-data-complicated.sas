data Complicated;
   set SASHELP.retail;
   where Year in (1980, 1983, 1985) and Sales ge 250;
run;
title "Listing of Data Set Complicated";
proc print data=Complicated noobs;
run;
