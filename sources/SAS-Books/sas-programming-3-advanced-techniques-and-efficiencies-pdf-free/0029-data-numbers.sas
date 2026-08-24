data numbers;
   input Value;
   datalines;
;
/*  z/OS DATA step */
/*
data numbers;
   input Value;
   datalines;
;
*/
data temp;
   set numbers;
   X=Value;
   do L=8 to 1 by -1;
      if X NE trunc(X,L) then
      do;
         MinLen=L+1;
         output;
         return;
      end;
   end;
run;
title;
proc print noobs;
   var Value MinLen;
run;
