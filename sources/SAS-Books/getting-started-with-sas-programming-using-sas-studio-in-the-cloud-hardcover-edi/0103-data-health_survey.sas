data Health_Survey;
   input ID $ Age Height Weight Heart_Rate SBP DBP;
   array Miss[6] Age Height Weight Heart_Rate SBP DBP;
   do i = 1 to 6;
      if Miss[i] = 999 then Miss[i] = .;
   end;
   drop i;
datalines;
001 23 68 190 68 120 999
002 56 72 220 76 140 88


003 37 999 999 80 132 78
004 82 60 110 80 999 999
;
title "Listing of Data Set Health_Survey";
proc print data=Health_Survey noobs;
run;
