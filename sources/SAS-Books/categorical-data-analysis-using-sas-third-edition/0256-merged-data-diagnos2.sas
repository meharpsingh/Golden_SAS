/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0256-data-diagnos.sas --- */
data diagnos;
input std1 $ test1 $ std2 $ test2 $ count;
do i=1 to count;
output;
end;
datalines;
;

/* --- 0257-data-diagnos2.sas --- */
data diagnos2;
set diagnos;
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
