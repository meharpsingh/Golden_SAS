data Old_Miss;
   input ID $ Age;
   if missing(Age)      then Age_group = .;
      else if Age le 50 then Age_group = 1;
      else                   Age_group = 2;
datalines;
001 15
002 .
003 78
004 26
;
title "Listing of Data Set Old_Miss";
proc print data=Old_Miss noobs;
run;
