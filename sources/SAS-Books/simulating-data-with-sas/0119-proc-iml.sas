proc iml;
/* convert a covariance matrix, S, to a correlation matrix */
start Cov2Corr(S);
D = sqrt(vecdiag(S));
return( S / D` / D );
/* divide columns, then divide rows */
finish;
