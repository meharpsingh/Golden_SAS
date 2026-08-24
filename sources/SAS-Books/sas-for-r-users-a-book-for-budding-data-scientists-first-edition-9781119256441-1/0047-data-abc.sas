DATA abc;
INPUT abc1 $char3. abc2 $char3. ;
DATALINES;
ab cd
;
run;
DATA result;
SET abc;
concate=abc1||abc2;
run;
proc print data=result;
Run;
