proc iml;
call randseed(12345);
pi = {0.35 0.5 0.15};
/* mixing probs for k groups */
NumObs = 100;
/* total num obs to sample
*/
N = RandMultinomial(1, NumObs, pi);
print N;
