data Survey;
   input (Q1-Q5)($1.);
   Number_Y = countc(cats(of Q1-Q5),'Y','i');
datalines;
YyYnn
NNnnn
NYNyy
;
title "Listing of Data Set Survey";
proc print data=Survey noobs;
run;
