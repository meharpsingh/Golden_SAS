%let N = 50;
/* size of each sample */
%let NumSamples = 10000;
/* number of samples
*/
proc iml;
call randseed(321);
x = j(&N, &NumSamples);
/* each column is a sample
*/
call randgen(x, "Normal");
/* x ~ N(0,1)
*/
SampleMean = mean(x);
/* mean of each column
*/
s = std(x);
/* std dev of each column
*/
talpha = quantile("t", 0.975, &N-1);
Lower = SampleMean - talpha * s / sqrt(&N);
Upper = SampleMean + talpha * s / sqrt(&N);
ParamInCI = (Lower<0 & Upper>0);
/* indicator variable
*/
PctInCI = ParamInCI[:];
/* pct that contain parameter */
print PctInCI;
