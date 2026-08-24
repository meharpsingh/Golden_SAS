data colds;
input gender $ residence $ per_cold count @@;
datalines;
female urban 0
female urban
female urban 2
female rural 0
female rural
1 104
female rural 2 116
male
urban 0
male
urban
1 124
male
urban 2
male
rural 0
male
rural
1 117
male
rural 2
;
proc freq data=colds order=data;
weight count;
tables gender*residence*per_cold / all nocol nopct;
run;
