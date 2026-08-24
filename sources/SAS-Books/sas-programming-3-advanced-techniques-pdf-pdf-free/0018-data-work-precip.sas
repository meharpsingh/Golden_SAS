data work.precip(drop=i);
    set pg3.weather_dublinmadrid_Monthly2017
       (keep=City PrecipQ1-PrecipQ4);
    array P[4] PrecipQ1-PrecipQ4;
    array Pct[4] PrecipPctQ1-PrecipPctQ4;
    do i=1 to 4;
    end;
    format PrecipPctQ1-PrecipPctQ4 percent8.1;
run;
