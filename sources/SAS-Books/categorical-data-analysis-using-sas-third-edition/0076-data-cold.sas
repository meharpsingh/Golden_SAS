data cold;
keep id day drainage;
input id day1-day4;
day=1; drainage=day1; output;
day=2; drainage=day2; output;
day=3; drainage=day3; output;
day=4; drainage=day4; output;
datalines;
1 1 1 2 2
2 0 0 0 0
3 1 1 1 1
4 1 1 1 1
5 0 2 2 0
6 2 0 0 0
7 2 2 1 2
8 1 1 1 0
9 3 2 1 1
10 2 2 2 3
11 1 0 1 1
12 2 3 2 2
13 1 3 2 1
14 2 1 1 1
15 2 3 3 3
16 2 1 1 1
17 1 1 1 1
18 2 2 2 2
19 3 1 1 1
20 1 1 2 1
21 2 1 1 2
22 2 2 2 2
23 1 1 1 1
24 2 2 3 1
25 2 0 0 0
26 1 1 1 1
27 0 1 1 0
;
