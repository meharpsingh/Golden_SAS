data ks;
input r @@;
datalines;
3 4 5
;
* Initial design;
data sample;
input x1 x2 x3 x4 x5 w @@;
datalines;
0.083 0.5 4 24 144 1.0
;
run;
