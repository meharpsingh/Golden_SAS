data Extract;
   informat Date mmddyy10.;
   input Date @@;     Day_of_Week = weekday(Date);     Day_of_Month = day(Date);
   Year = year(Date);
   format Date mmddyyd10.;
datalines;
1/5/2000 2/8/2000 4/23/2000 4/12/2000 8/21/2000 8/21/2000
8/22/2000
12/12/2000 12/15/2000 12/18/2000
2/22/2001 2/1/2001 4/18/2001 4/18/2001 4/18/2001 9/17/2001
12/25/2001
12/22/2001 3/3/2001 3/6/2001 3/7/2001
;
title "Listing of the First Eight Observations from Extract";
proc print data=Extract (obs=8);  run;
title "Frequencies for Day of the Week";
proc sgplot data=Extract;     vbar Day_of_Week;
run;
