proc iml;
size = do(500, 2000, 250);
/* 500, 1000, ..., 2000
*/
time = j(1, ncol(size));
/* allocate vector for results
*/
call randseed(12345);
do i = 1 to ncol(size);
n = size[i];
r = j(n*(n+1)/2, 1);
/* generate lower triangular elements */
call randgen(r, "uniform");
A = sqrvech(r);
/* create symmetric matrix
*/
t0 = time();
evals = eigval(A);
time[i] = time()-t0;
/* elapsed time for computation
*/
end;
