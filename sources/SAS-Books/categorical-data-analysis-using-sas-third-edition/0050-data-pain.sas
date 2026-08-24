data pain;
input treatment $ hours count @@;
datalines;
placebo
0 6 placebo
9 placebo
2 6 placebo
3 3 placebo
4 1
standard 0 1 standard 1
4 standard
2 6 standard 3 6 standard 4 8
test
0 2 test
5 test
2 6 test
3 8 test
4 6
;
proc freq;
weight count;
tables treatment*hours/ cmh nocol nopct;
run;
