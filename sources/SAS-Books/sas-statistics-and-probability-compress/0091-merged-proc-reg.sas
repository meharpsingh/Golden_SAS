/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0091-data-normal.sas --- */
data normal;
* data set;
call streaminit(1234567);
* set random number stream;
do sample = 1 to 10000;
* outer loop repeat samples;
do n = 1 to 40;
* start inner loop;
if n < 21 then x = 10;
* x = 10 for n<=20;
else x = 20;
* x = 20 for n>20;
e = rand('normal',0,50);
* e is N(0,2500);
y = 100 + 10*x + e;
* DGP;
output;
* output to data set;
end;
* end inner loop;
end;
* end outer loop;
run;

/* --- 0092-proc-reg.sas --- */
proc reg noprint data=normal outest=est tableout MSE;
model y = x;
by sample;
* repeat for each sample;
run;

/* --- 0108-proc-reg.sas --- */
proc reg noprint data=normal outest=est tableout;
model y = x/ alpha=.05 clb;
by sample;
run;
