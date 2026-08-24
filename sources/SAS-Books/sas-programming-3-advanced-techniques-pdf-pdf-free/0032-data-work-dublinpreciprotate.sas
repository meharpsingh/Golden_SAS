data work.DublinPrecipRotate;
set pg3.weather_dublinmadrid_monthly5yr
(keep=City Year PrecipQ1-PrecipQ4);
where City='Dublin';
array P[4] PrecipQ1-PrecipQ4;
do Quarter=1 to 4;
Precip=P[Quarter]*2.54;
output;
end;
format Precip 6.2;
drop PrecipQ1-PrecipQ4;
run;
