data work.MPG_As_Character_Data;
set sashelp.cars;
MPG_City_Characters = put(MPG_City,2.);
run;
proc freq data=work.MPG_As_Character_Data noprint;
tables type*MPG_City_Characters /
out=work.FREQout_MPGasCharData;
run;
proc sort data=work.FREQout_MPGasCharData
  out=work.FREQout_MPGasCharData_Sorted;
by MPG_City_Characters;
run;
