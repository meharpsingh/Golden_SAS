data respire;
input center treatment $ response $ count @@;
n_response=(response='y');
datalines;
1 test
y 29 1 test
n 16
1 placebo y 14 1 placebo n 31
2 test
y 37 2 test
n
2 placebo y 24 2 placebo n 21
;
