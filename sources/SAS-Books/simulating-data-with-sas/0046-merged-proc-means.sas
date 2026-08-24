/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0046-data-simnormal.sas --- */
%let N = 31;
/* size of each sample */
%let NumSamples = 10000;
/* number of samples
*/
/* 1. Simulate data */
data SimNormal;
call streaminit(123);
do SampleID = 1 to &NumSamples;
do i = 1 to &N;
x = rand("Normal");
output;
end;
end;
run;
/* 2. Compute statistics for each sample */
proc means data=SimNormal noprint;
by SampleID;
var x;
output out=OutStatsNorm mean=SampleMean median=SampleMedian var=SampleVar;
run;

/* --- 0047-proc-means.sas --- */
proc means data=OutStatsNorm Var;
var SampleMean SampleMedian;
run;

/* --- 0048-proc-sgplot.sas --- */
proc sgplot data=OutStatsNorm;
title "Sampling Distributions of Mean and Median for N(0,1) Data";
density SampleMean /
type=kernel legendlabel="Mean";
density SampleMedian / type=kernel legendlabel="Median";
refline 0 / axis=x;
run;

/* --- 0075-proc-means.sas --- */
proc means data=SimNormal;
by SampleID;
var x;
ods output Summary=Desc;
run;
