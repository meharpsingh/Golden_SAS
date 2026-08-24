proc iml;
Observed = {8 4 4 3 6 11};
/* observed counts */
k = ncol(Observed);
/*
*/
N = sum(Observed);
/* 36
*/
p = j(1, k, 1/k);
/* {1/6,...,1/6}
*/
Expected = N*p;
/* {6,6,...,6}
*/
qObs = sum( (Observed-Expected)##2/Expected );
/* q
*/
/* simulate from null hypothesis */
NumSamples = 10000;
counts = RandMultinomial(NumSamples, N, p);
/* 10,000 samples
*/
Q = ((counts-Expected)##2/Expected )[ ,+];
/* sum each row
*/
pval = sum(Q>=qObs) / NumSamples;
/* proportion > q
*/
print qObs pval;
