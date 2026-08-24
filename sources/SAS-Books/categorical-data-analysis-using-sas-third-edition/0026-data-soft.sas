data soft;
input gender $ country $ question $ count @@;
datalines;
male
American
y 29 male
American
n
male
British
y 19 male
British
n 15
female American
y
7 female American
n 23
female British
y 24 female British
n 29
;
proc freq order=data;
weight count;
tables gender*country*question /
chisq cmh nocol nopct;
run;
