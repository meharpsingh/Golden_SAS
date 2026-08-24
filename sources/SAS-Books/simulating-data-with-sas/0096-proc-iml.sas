%let N = 1000;
/* size of each sample */
/* Multivariate normal data */
proc iml;
/* specify the mean and covariance of the population */
Mean = {1, 2, 3};
Cov = {3 2 1,
2 4 0,
1 0 5};
call randseed(4321);
X = RandNormal(&N, Mean, Cov);
/* 1000 x 3 matrix
*/
/* check the sample mean and sample covariance */
SampleMean = mean(X);
/* mean of each column */
SampleCov =
cov(X);
/* sample covariance
*/
/* print results */
c = "x1":"x3";
print (X[1:5,])[label="First 5 Obs: MV Normal"];
print SampleMean[colname=c];
print SampleCov[colname=c rowname=c];
