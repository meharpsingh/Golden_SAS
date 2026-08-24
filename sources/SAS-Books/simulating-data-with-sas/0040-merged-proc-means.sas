/* Merged listing: this program was assembled from 5 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0040-data-simuni.sas --- */
%let N = 10;
/* size of each sample */
%let NumSamples = 1000;
/* number of samples
*/
/* 1. Simulate data */
data SimUni;
call streaminit(123);
do SampleID = 1 to &NumSamples;
do i = 1 to &N;
x = rand("Uniform");
output;
end;
end;
run;
/* 2. Compute mean for each sample */
proc means data=SimUni noprint;
by SampleID;
var x;
output out=OutStatsUni mean=SampleMean;
run;

/* --- 0041-proc-means.sas --- */
proc means data=OutStatsUni N Mean Std P5 P95;
var SampleMean;
run;

/* --- 0042-proc-univariate.sas --- */
ods graphics on;
/* use ODS graphics
*/
proc univariate data=OutStatsUni;
label SampleMean = "Sample Mean of U(0,1) Data";
histogram SampleMean / normal;
/* overlay normal fit */
ods select Histogram;
run;

/* --- 0043-proc-univariate.sas --- */
proc univariate data=OutStatsUni noprint;
var SampleMean;
output out=Pctl95 N=N mean=Mean pctlpts=2.5 97.5 pctlpre=Pctl;
run;
proc print data=Pctl95 noobs;
run;

/* --- 0044-data-prob.sas --- */
data Prob;
set OutStatsUni;
LargeMean = (SampleMean>0.7);
/* create indicator variable */
run;
proc freq data=Prob;
tables LargeMean / nocum;
/* compute proportion
*/
run;
