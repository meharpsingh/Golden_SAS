proc iml;
call randseed(12345);
NumSamples = 1000;
/* number of Wishart draws
*/
N = 50;
/* MVN sample size
*/
Sigma = {9 1,
1 1};
/* Simulate matrices. Each row is scatter matrix */
A = RandWishart(NumSamples, N-1, Sigma);
B = A / (N-1);
/* each row is covariance matrix
*/
S1 = shape(B[1,], 2, 2);
/* first row, reshape into 2 x 2
*/
S2 = shape(B[2,], 2, 2);
/* second row, reshape into 2 x 2 */
print S1 S2;
/* two 2 x 2 covariance matrices
*/
SampleMean = shape(B[:,], 2, 2);
/* mean covariance matrix
*/
print SampleMean;
