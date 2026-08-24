proc iml;
N = 4;
/* want 4x4 symmetric matrix
*/
call randseed(1);
v = j(N*(N+1)/2, 1);
/* allocate lower triangular
*/
call randgen(v, "Uniform");
/* fill with random
*/
x = sqrvech(v);
/* create symmetric matrix from v */
print x[format=5.3];
