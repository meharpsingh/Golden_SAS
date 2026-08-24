data voters;
/* input the FIPS values of the state and the counties, then the number of voters who voted for the democratic candidate and the number of voters who voted republican */
   input State County Republican Democrat;
/*if the county's number of democratic voters are higher than the republicans then mark this county's party as 1 and 2 if republicans are higher*/
if democrat > republican then party=1;
else if democrat< republican then party=2;
/*actual data values*/
   datalines;
23 1 28189 22975
23 3 19419 13377
23 5 57697 102935
23 7 7900 7001
23 9 13682 16107
23 11 29296 31753
23 13 9148 12440
23 15 9727 10241
23 17 12172 16214
23 19 41601 32832
23 21 5403 3098
23 23 9304 10679
23 25 14998 9092
23 27 10378 10442
23 29 9037 6358
23 31 50388 55828
;
run;
