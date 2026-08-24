%let N = 20;
/* size of each sample */
%let NumSamples = 1000;
/* number of samples
*/
proc iml;
call randseed(123);
mu = {0 0}; Sigma = {1 0.3, 0.3 1};
rho = j(&NumSamples, 1);
/* allocate vector for results
*/
do i = 1 to &NumSamples;
/* simulation loop
*/
x = RandNormal(&N, mu, Sigma); /* simulated data in N x 2 matrix */
rho[i] = corr(x)[1,2];
/* Pearson correlation
*/
end;
/* compute quantiles of ASD; print with labels */
call qntl(q, rho, {0.05 0.25 0.5 0.75 0.95});
print (q`)[colname={"P5" "P25" "Median" "P75" "P95"}];
