data A(type=corr);
_type_='CORR';
input x1-x3;
cards;
1.0
.
.
0.7 1.0
.
0.2 0.4 1.0
;
run;
/* obtain factor pattern matrix from PROC FACTOR */
proc factor data=A N=3 eigenvectors;
ods select FactorPattern;
run;
/* Perform the same computation in SAS/IML language */
proc iml;
R = {1.0 0.7 0.2,
0.7 1.0 0.4,
0.2 0.4 1.0};
/* factor pattern matrix via the eigenvalue decomp.
R = U*diag(D)*U` = H`*H = F*F` */
call eigen(D, U, R);
F = sqrt(D`) # U;
/* F is returned by PROC FACTOR */
Verify = F*F`;
print F[format=8.5] Verify;
