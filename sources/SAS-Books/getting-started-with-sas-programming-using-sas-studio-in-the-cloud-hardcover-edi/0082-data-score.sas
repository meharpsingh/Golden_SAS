data Score;
   input ID $ Q1-Q10;
   if n(of Q1-Q5) ge 3 then Score1 = mean(of Q1-Q5);
   if nmiss(of Q6-Q10) le 2 then Score2 = mean(of Q6-Q10);
   Score3 = max(of Q1-Q10);
   Score4 = sum(largest(1,of Q1-Q10),
                largest(2,of Q1-Q10),
                largest(3,of Q1-Q10));
datalines;
001 9 7 8 6 7 6 . . 9 2
002 . . . . 9 8 7 8 9 9
003 6 7 6 7 6 . . . 9 9
;
title "Listing of Data Set Score";
proc print data=Score noobs;
run;
