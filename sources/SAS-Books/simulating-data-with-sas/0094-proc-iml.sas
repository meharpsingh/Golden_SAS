%let N = 1000;
/* size of each sample
*/
proc iml;
call randseed(4321);
/* set seed for RandMultinomial */
prob = {0.5 0.2 0.3};
X = RandMultinomial(&N, 100, prob);
/* one sample, N x 3 matrix */
/* print a few results */
c = {"black", "brown", "white"};
first = X[1:5,];
print first[colname=c label="First 5 Obs: Multinomial"];
