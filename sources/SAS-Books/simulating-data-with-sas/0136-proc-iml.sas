proc iml;
call randseed(1);
beta = {-143, 3.9};
rmse = 11.23;
use Sashelp.Class NOBS N;
/* N = sample size
*/
read all var {Height} into X1;
/* read data
*/
close Sashelp.Class;
X = j(N,1,1) || X1;
/* add intercept column
*/
eta = X*beta;
