data InvGauss(keep= X);
mu = 1.5;
/* mu > 0
*/
lambda = 2;
/* lambda > 0 */
c = mu/(2 * lambda);
call streaminit(1);
do i = 1 to 1000;
muY = mu * rand("Normal")**2;
/* or mu*rand("ChiSquare", 1) */
X = mu + c*muY - c*sqrt(4*lambda*muY + muY**2);
/* return X with probability mu/(mu+X); otherwise mu**2/X */
if rand("Uniform") > mu/(mu+X) then /* or rand("Bern", X/(mu+X)) */
X = mu*mu/X;
output;
end;
run;
