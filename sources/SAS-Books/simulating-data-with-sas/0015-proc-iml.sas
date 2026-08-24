proc iml;
/* define parameters */
p = 1/2;
lambda = 4;
k = 6;
prob = {0.5 0.2 0.3};
/* allocate vectors */
N = 100;
Bern = j(1, N);
Bino = j(1, N);
Geom = j(1, N);
Pois = j(1, N);
Unif = j(1, N);
Tabl = j(1, N);
/* fill vectors with random values */
call randseed(4321);
call randgen(Bern, "Bernoulli", p);
/* coin toss
*/
call randgen(Bino, "Binomial", p, 10);
/* num heads in 10 tosses
*/
call randgen(Geom, "Geometric", p);
/* num trials until success */
call randgen(Pois, "Poisson", lambda);
/* num events per unit time */
call randgen(Unif, "Uniform");
/* uniform in (0,1)
*/
Unif = ceil(k * Unif);
/* roll die with k sides
*/
call randgen(Tabl, "Table", prob);
