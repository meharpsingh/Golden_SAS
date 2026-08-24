/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0170-data-cardio.sas --- */
data cardio;
input animal treatment $ response $ @@;
if treatment='S' then delete;
else if treatment='C'
then ordtreat=1;
else if treatment='DA' then ordtreat=2;
else if treatment='D1' then ordtreat=3;
else if treatment='D2' then ordtreat=4;
datalines;
1 S no
1 C
no
1 C
no
1 D2 yes 1 D1 yes
2 S no
2 D2 yes 2 C
no
2 D1 yes
3 S no
3 C
;

/* --- 0171-proc-logistic.sas --- */
proc logistic data=cardio descending exactonly;
strata animal;
model response = ordtreat;
exact ordtreat / estimate=both;
run;

/* --- 0172-proc-logistic.sas --- */
proc logistic data=cardio descending;
strata animal;
model response = ordtreat /selection=forward
details slentry=.05;
run;

/* --- 0174-proc-template.sas --- */
proc template;
edit Stat.XCL.PValue;
format=D8.6;
end;
run;
proc logistic data=cardio descending;
strata animal;
model response = ordtreat;
exact ordtreat / estimate=parm;
run;
