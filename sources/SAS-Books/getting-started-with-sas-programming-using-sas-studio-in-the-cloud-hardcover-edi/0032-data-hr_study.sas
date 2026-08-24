data HR_Study;
   do Drug_Group = 'Placebo','Drug A','Drug B';
      input Heart_Rate @;
      output;
   end;
datalines;
80 70 60
82 77 63
76 74 70
78 80 67
;
title "Listing of Data Set HR_Study";
proc print data=HR_Study noobs;
run;
