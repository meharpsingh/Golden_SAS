data vaccine2;
input Outcome $ Count @@;
datalines;
fail 3 success 58
;
ods select BinomialCLs;
proc freq;
weight count;
tables Outcome / binomial (exact);
ods output BinomialCLs=BinomialCLs;
run;
