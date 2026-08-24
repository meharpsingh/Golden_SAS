data test;
length X 3;
X=8193;
run;
data _null_;
set test;
put X=;
run;
