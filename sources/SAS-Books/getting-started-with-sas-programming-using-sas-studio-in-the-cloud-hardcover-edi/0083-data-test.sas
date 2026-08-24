data Test;
   input Stud_ID $ Score1-Score10;
   call sortn(of Score1-Score10);
   Mean_Top_8 = mean(of Score3-Score10);
datalines;
001 90 90 80 78 100 95 90 92 88 82
002 50 55 60 65 70 75 80 85 90 95


;
title "Listing of Data Set TEST";
proc print data=Test;
   id Stud_ID;
   var Score1-Score10 Mean_Top_8;
run;
