data work.MPG_As_Character_Data;
set sashelp.cars;
MPG_City_Characters = put(MPG_City,2.);
run;
