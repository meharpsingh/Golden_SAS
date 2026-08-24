data medical;
input interval treatment $ censor count @@;
datalines;
0 control 1 9 0 control 0 15
1 control 1 7 1 control 0 13
2 control 1 6 2 control 0
3 control 1 17
0 active 1 9 0 active 0 12
1 active 1 3 1 active 0
2 active 1 4 2 active 0 10
3 active 1 45
;
run;
