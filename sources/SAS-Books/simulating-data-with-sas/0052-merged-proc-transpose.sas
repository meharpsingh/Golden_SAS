/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0052-data-simsk.sas --- */
%let N = 50;
/* size of each sample */
%let NumSamples = 1000;
/* number of samples
*/
data SimSK(drop=i);
call streaminit(123);
do SampleID = 1 to &NumSamples;
/* simulation loop
*/
do i = 1 to &N;
/* N obs in each sample
*/
Normal
= rand("Normal");
/* kurt=0
*/
t
= rand("t", 5);
/* kurt=6 for t, exp, and logn */
Exponential = rand("Expo");
LogNormal
= exp(rand("Normal", 0, 0.503));
output;
end;
end;
run;
proc means data=SimSK noprint;
by SampleID;
var Normal t Exponential LogNormal;
output out=Moments(drop=_type_ _freq_) Kurtosis=;
run;

/* --- 0053-proc-transpose.sas --- */
proc transpose data=Moments out=Long(rename=(col1=Kurtosis));
by SampleID;
run;
proc sgplot data=Long;
title "Kurtosis Bias in Small Samples: N=&N";
label _Name_ = "Distribution";
vbox Kurtosis / category=_Name_ meanattrs=(symbol=Diamond);
refline 0 6 / axis=y;
yaxis max=30;
xaxis discreteorder=DATA;
run;
