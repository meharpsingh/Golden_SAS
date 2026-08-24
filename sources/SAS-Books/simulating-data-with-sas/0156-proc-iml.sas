%let N = 100;
proc iml;
call randseed(1);
mu =
{0 0 0};
/* means
*/
Cov = {10 3 -2, 3 6 1, -2 1 2};
/* covariance for X
*/
kX = 25;
/* contamination factor for
X */
pX = 0.15;
/* prob of contamination for X */
kY = 10;
/* contamination factor for
Y */
pY = 0.25;
/* prob of contamination for Y */
/* simulate contaminated normal (mixture) distribution */
call randgen(N1, "Binomial", 1-pX, &N); /* N1=num of uncontaminated */
X = j(&N, ncol(mu));
X[1:N1,] = RandNormal(N1, mu, Cov);
/* draw N1 from uncontam */
X[N1+1:&N,] = RandNormal(&N-N1, mu, kX*Cov); /* N-N1 from contam
*/
/* simulate error term according to contaminated normal */
outlier = j(&N, 1);
call randgen(outlier, "Bernoulli", pY);
/* choose outliers
*/
eps = j(&N, 1);
call randgen(eps, "Normal", 0, 1);
/* uncontaminated N(0,1) */
outlierIdx = loc(outlier);
if ncol(outlierIdx)>0 then
/* if outliers...
*/
eps[outlierIdx] = kY * eps[outlierIdx]; /* set eps ~ N(0,kY)
*/
/* generate Y according to regression model */
beta = {2, 1, -1};
/* params, not including intercept */
Y = 1 + X*beta + eps;
