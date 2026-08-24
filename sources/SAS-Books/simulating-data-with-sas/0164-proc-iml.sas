proc iml;
k=3;
/* 3 measurements on growth curve
*/
s=5;
/* 5 individuals
*/
sigma2_R = 1.4;
/* Parameter 1: residual covariance */
sigma2_CS = 2;
/* Parameter 2: common covariance
*/
B = sigma2_R*j(k,k,1) + sigma2_CS*I(k);
/* cs matrix
*/
R = B;
/* first block
*/
do i = 2 to s;
/* create block-diagonal matrix
*/
R = block(R, b);
/*
with s blocks
*/
end;
