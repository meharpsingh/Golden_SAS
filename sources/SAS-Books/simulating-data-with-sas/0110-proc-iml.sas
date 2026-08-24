proc iml;
start ImanConoverTransform(Y, C);
X = Y;
N = nrow(X);
R = J(N, ncol(X));
/* compute scores of each column */
do i = 1 to ncol(X);
h = quantile("Normal", rank(X[,i])/(N+1) );
R[,i] = h;
end;
/* these matrices are transposes of those in Iman & Conover */
Q = root(corr(R));
P = root(C);
S = solve(Q,P);
/* same as
S = inv(Q) * P; */
M = R*S;
/* M has rank correlation close to target C */
/* reorder columns of X to have same ranks as M.
In Iman-Conover (1982), the matrix is called R_B. */
do i = 1 to ncol(M);
rank = rank(M[,i]);
y = X[,i];
call sort(y);
X[,i] = y[rank];
end;
return( X );
finish;
