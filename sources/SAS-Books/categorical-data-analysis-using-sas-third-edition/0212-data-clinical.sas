data clinical;
input time $ treatment $ status $ count @@;
datalines;
0-1 control recur 15 0-1 control not 50
0-1 active
recur 12 0-1 active
not 69
1-2 control recur 13 1-2 control not 30
1-2 active
recur
7 1-2 active
not 59
2-3 control recur
7 2-3 control not 17
2-3 active
recur 10 2-3 active
not 45
;
proc freq order=data;
weight count;
tables time*treatment*status / cmh;
run;
