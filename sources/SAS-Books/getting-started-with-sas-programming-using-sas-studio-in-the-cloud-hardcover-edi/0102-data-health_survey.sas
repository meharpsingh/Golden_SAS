data Health_Survey;
   input ID $ Age Height Weight Heart_Rate SBP DBP;
   if Age = 999 then Age = .;
   if Height = 999 then Height = .;
   if Weight = 999 then Weight = .;
   if Heart_Rate = 999 then Heart_Rate = .;
   if SBP = 999 then SBP = .;
   if DBP = 999 then DBP = .;
datalines;
001 23 68 190 68 120 999
002 56 72 220 76 140 88
003 37 999 999 80 132 78
004 82 60 110 80 999 999
;
title "Listing of Data Set Health_Survey";
proc print data=Health_Survey noobs;
run;
