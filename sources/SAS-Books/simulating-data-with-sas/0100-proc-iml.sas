proc iml;
/* specify population mean and covariance */
Mean = {1, 2, 3};
Cov = {3 2 1,
2 4 0,
1 0 5};
call randseed(4321);
X = RandMVT(100, 4, Mean, Cov);
/* 100 draws; 4 degrees of freedom */
