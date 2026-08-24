%let n1 = 10;
%let n2 = 10;
%let NumSamples = 1e4;
/* number of samples */
proc iml;
/* 1. Simulate the data by using RANDSEED and RANDGEN, */
call randseed(321);
x = j(&n1, &NumSamples);
/* allocate space for Group 1 */
y = j(&n2, &NumSamples);
/* allocate space for Group 2 */
call randgen(x, "Normal", 10);
/* fill matrix from N(0,10)
*/
call randgen(y, "Exponential");
/* fill from Exp(1)
*/
y = 10 * y;
/* scale to Exp(10)
*/
/* 2. Compute the t statistics; VAR operates on columns */
meanX = mean(x);
varX = var(x);
/* mean & var of each sample
*/
meanY = mean(y);
varY = var(y);
/* compute pooled standard deviation from n1 and n2 */
poolStd = sqrt( ((&n1-1)*varX + (&n2-1)*varY)/(&n1+&n2-2) );
/* compute the t statistic */
t = (meanX - meanY) / (poolStd*sqrt(1/&n1 + 1/&n2));
/* 3. Construct indicator var for tests that reject H0 */
alpha = 0.05;
RejectH0 = (abs(t)>quantile("t", 1-alpha/2, &n1+&n2-2));
/* 0 or 1 */
/* 4. Compute proportion: (# that reject H0)/NumSamples */
Prob = RejectH0[:];
print Prob;
