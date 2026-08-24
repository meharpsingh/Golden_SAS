%let N = 10;
%let NumSamples = 1000;
proc iml;
call randseed(123);
x = j(&NumSamples,&N);
/* many samples (rows), each of size N */
call randgen(x, "Uniform");
/* 1. Simulate data
*/
s = x[,:];
/* 2. Compute statistic for each row
*/
Mean = mean(s);
/* 3. Summarize and analyze ASD
*/
StdDev = std(s);
call qntl(q, s, {0.05 0.95});
print Mean StdDev (q`)[colname={"5th Pctl" "95th Pctl"}];
/* compute proportion of statistics greater than 0.7 */
Prob = mean(s > 0.7);
print Prob[format=percent7.2];
