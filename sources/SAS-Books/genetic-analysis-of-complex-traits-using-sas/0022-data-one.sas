data one;
 input  gen sex$ indiv mom dad cov;
datalines;
 0 F 3 4 .   .05
 0 M 2 4 .   .05
 0 F 1 . .   .05
 1 F 5 1 2   .
 1 M 6 3 2   .
 1 F 7 1 2   .
 2 F 8 5 6   .
 2 M 9 7 6   .
 3 F 10 8 9  .
;
proc inbreed ;
 var indiv dad mom cov;
 matings 3/4 , 8/9 , 2/3;
run;
proc inbreed average init=.05 matrix;
 class gen;
 gender sex;
 var indiv dad mom;
run;
