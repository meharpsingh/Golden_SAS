/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0022-data-a.sas --- */
data a;
call streaminit(0);
/* different stream each time */
do i = 1 to 10;
x=rand("uniform"); output;
end;
run;
data b;
call streaminit(&sysrandom);
/* use SYSRANDOM to set same seed */
do i = 1 to 10;
x=rand("uniform"); output;
end;
run;
proc compare base=a compare=b short;
/* show they are identical */
run;

/* --- 0106-proc-iml.sas --- */
proc iml;
/* Sample from a multivariate Cauchy distribution */
start RandMVCauchy(N, p);
z = j(N,p,0);
y = j(N,1);
/* allocate matrix and vector */
call randgen(z, "Normal");
call randgen(y, "Gamma", 0.5);
/* alpha=0.5, unit scale
*/
return( z / sqrt(2*y) );
finish;
/* call the function to generate multivariate Cauchy variates */
N=1000; p = 3;
x = RandMVCauchy(N, p);
