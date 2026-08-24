proc iml;
A = { 2 -1
0,
-1
2 -1,
0 -1
2 };
/* finite-precision test of whether a matrix is symmetric */
start SymCheck(A);
B = (A + A`)/2;
scale = max(abs(A));
delta = scale * constant("SQRTMACEPS");
return( all( abs(B-A)< delta ) );
finish;
/* test a matrix for symmetry */
IsSym = SymCheck(A);
print IsSym;
