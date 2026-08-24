data Nonstandard;
   input Patno $ 1-3 Month 6-7 Day 13-14 Year 20-23;
   Date = mdy(Month,Day,Year);
   format date mmddyy10.;
datalines;
001  05     23     1998
006  11     01     1998
123  14     03     1998
137  10            1946
;
title "Listing of data set Nonstandard";
proc print data=Nonstandard;
   id Patno;
run;
