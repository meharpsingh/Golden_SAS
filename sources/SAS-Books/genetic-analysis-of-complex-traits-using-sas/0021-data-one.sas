options ls=78;
data one;
 input  indiv mom dad;
datalines;
 5 1 .
 6 1 .
 8 5 6
 9 8 .
 10 8 .
 11 9 10
;
proc inbreed matrix ;
run;
