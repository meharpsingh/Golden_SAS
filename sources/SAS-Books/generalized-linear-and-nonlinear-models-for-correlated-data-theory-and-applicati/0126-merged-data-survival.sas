/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0126-proc-format.sas --- */
proc format;
value trtfmt
0='Control' 1='Treated';
run;
proc sort data=SASdata.ADEMEX GFR Data
out=example7 3 1;
by ptid Months;
run;
data example7 3 1;
set example7 3 1;
by ptid Months;
Indicator=0;
t1=0;t2=0;
Risktime=1;
Response=GFR ml min;
run;

/* --- 0127-data-survival.sas --- */
data survival;
set example7 3 1;
by ptid Months;
if last.ptid;
run;
data survival1;
set survival;
do t1=0 to 24 by 6;
if t1< 24 then t2 = t1+6;
if t1=24 then t2 = 36;
Event=0;
Risktime=t2-t1;
if t1<ITTtime<=t2 then do;
Event=ITTdeath;
Risktime=ITTtime - t1;
end;
output;
end;
run;
data survival1;
set survival1;
Interval=t1;
if t1>ITTtime then delete;
