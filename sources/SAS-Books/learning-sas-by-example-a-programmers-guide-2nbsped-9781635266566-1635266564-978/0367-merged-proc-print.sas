/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0367-data-vitals.sas --- */
data vitals;
   input ID    : $3.
         Age
         Pulse
         SBP
         DBP;
   label SBP = "Systolic Blood Pressure"
         DBP = "Diastolic Blood Pressure";
datalines;
001 23 68 120 80
002 55 72 188 96
003 78 82 200 100
004 18 58 110 70
005 43 52 120 82
006 37 74 150 98
007  . 82 140 100
;
***Note: this program assumes there are no
   missing values for Pulse or SBP;
data newvitals;
   set vitals;
   if Age lt 50 and not missing(Age) then do;
      if Pulse lt 70 then PulseGroup = 'Low ';
      else PulseGroup = 'High';
      if SBP lt 140 then SBPGroup = 'Low ';
      else SBPGroup = 'High';
   end;
   else if Age ge 50 then do;
      if Pulse lt 74 then PulseGroup = 'Low';
      else PulseGroup = 'High';
      if SBP lt 140 then SBPGroup = 'Low';
      else SBPGroup = 'High';
   end;
run;

/* --- 0368-proc-print.sas --- */
proc print data=newvitals noobs;
run;
*8-3;
data test;
   input Score1-Score3;
   Subj + 1;
datalines;
90 88 92
75 76 88
88 82 91
72 68 70
;
title "Listing of TEST";
proc print data=test noobs;
run;
*8-5;
data logs;
   do N = 1 to 20;
      LogN = log(N);
      output;
   end;
run;
title "Listing of LOGS";
proc print data=logs noobs;
run;
*8-7;
data plotit;
   do x = 0 to 10 by .1;
      y = 3*x**2 - 5*x + 10;
      output;
   end;
run;
title "Problem 7";
proc sgplot data=plotit;
   series x=x y=y;
run;
*8-9;
data temperatures;
   do Day = 'Mon','Tues','Wed','Thu','Fri','Sat','Sun';
      input Temp @;
      output;
   end;
datalines;
70 72 74 76 77 78 85
;
title "Listing of TEMPERATURES";
proc print data=temperatures noobs;
run;
*8-11;
data temperature;
   length City $ 7;
Solutions to Odd-Numbered Exercises   471
   do City = 'Dallas','Houston';
      do Hour = 1 to 24;
         input Temp @;
         output;
      end;
   end;
datalines;
80 81 82 83 84 84 87 88 89 89
91 93 93 95 96 97 99 95 92 90 88
86 84 80 78 76 77 78
80 81 82 82 86
88 90 92 92 93 96 94 92 90
88 84 82 78 76 74
;
title "Temperatures in Dallas and Houston";
proc print data=temperature;
run;
*8-13;
data money;
   do Year = 1 to 999 until (Amount ge 30000);
      Amount + 1000;
      do Quarter = 1 to 4;
         Amount + Amount*(.0425/4);
      output;
      end;
   end;
   format Amount dollar10.;
run;
title "Listing of MONEY";
proc print data=money;
run;
