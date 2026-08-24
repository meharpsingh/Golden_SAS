/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0159-data-diagnosis.sas --- */
data diagnosis;
input std1 $ test1 $ std2 $ test2 $ count;
do i=1 to count;
output;
end;
datalines;
;

/* --- 0160-data-diagnosis2.sas --- */
data diagnosis2;
set diagnosis;
drop std1 test1 std2 test2;
subject=_n_;
time=1; procedure='standard';
response=std1; output;
time=1; procedure='test';
response=test1; output;
time=2; procedure='standard';
response=std2; output;
time=2; procedure='test';
response=test2; output;
run;
