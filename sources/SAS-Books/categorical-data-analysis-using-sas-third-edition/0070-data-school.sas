data school;
input school program $ style $ count @@;
datalines;
1 regular
self 10
1 regular
team 17 1 regular class
1 after
self
1 after
team 12 1 after
class
2 regular
self 21
2 regular
team 17 2 regular class
2 after
self 16
2 after
team 12 2 after
class
3 regular
self 15
3 regular
team 15 3 regular class
3 after
self 12
3 after
team 12 3 after
class
;
proc freq;
weight count;
tables school*program*style / cmh chisq;
run;
