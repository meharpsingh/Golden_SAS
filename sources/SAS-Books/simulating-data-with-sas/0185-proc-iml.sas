%let N = 100;
proc iml;
phi
= {1 -0.4};
/* AR coefficients: Notice the negative sign!
*/
theta = {1};
/* MA coefficients: Use {1, 0.1} to add MA term */
mu = 0;
/* mean of process
*/
sigma = 1;
/* std dev of process
*/
seed = -54321;
/* use negative seed if you call ARMASIM twice
*/
yt = armasim(phi, theta, mu, sigma, &N, seed);
