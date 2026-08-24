proc transpose data=pg3.weather_dublin_monthly5yr
                   (where=(Year in (2013,2014))
                    keep=Year Temp1-Temp3)
               out=work.dublin_monthly5yr_rotated
                  (rename=(COL1=TempMonthlyAvg))
               name=MonthChar;
    by Year;
    var Temp1-Temp3;
run;
data work.dublin_monthly5yr;
    set work.dublin_monthly5yr_rotated;
    Month=input(substr(MonthChar,5),2.);
    drop MonthChar;
run;
data work.dublin_daily5yr;
    set pg3.weather_dublin_daily5yr
           (where=(day(Date)=15 and
                   month(Date) le 3 and
                   year(Date) in (2013,2014))
            keep=Date TempDailyAvg);
    Year=year(Date);
    Month=month(Date);
run;
data work.dublin_daily_monthly;
    merge work.dublin_daily5yr
          work.dublin_monthly5yr;
    by Year Month;
    Difference=TempDailyAvg-TempMonthlyAvg;
    drop Year Month;
