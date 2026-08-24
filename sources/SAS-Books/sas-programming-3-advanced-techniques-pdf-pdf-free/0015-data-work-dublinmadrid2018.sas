data work.DublinMadrid2018(drop=Month);
set pg3.weather_dublinmadrid_monthly2018
(keep=City Temp:);
array Temperature[*] Temp:;
do Month=1 to dim(Temperature);
Temperature[Month]=(Temperature[Month]-32)*5/9;
end;
format Temp: 6.1;
run;
Use the DIM
function to return
the number of
elements in an array.
DIM(array-name)
3.02 Activity
array Temperature[12] Temp1-Temp12;
do Month=1 to 12;
