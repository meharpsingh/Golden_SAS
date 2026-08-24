/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0050-data-simunisize.sas --- */
%let NumSamples = 1000;
/* number of samples */
/* 1. Simulate data */
data SimUniSize;
call streaminit(123);
do N = 10, 30, 50, 100;
do SampleID = 1 to &NumSamples;
do i = 1 to N;
x = rand("Uniform");
output;
end;
end;
end;
run;

/* --- 0051-proc-means.sas --- */
proc means data=SimUniSize noprint;
by N SampleID;
var x;
output out=OutStats mean=SampleMean;
run;
/* 3. Summarize approx. sampling distribution of statistic */
proc means data=OutStats Mean Std;
class N;
var SampleMean;
run;
