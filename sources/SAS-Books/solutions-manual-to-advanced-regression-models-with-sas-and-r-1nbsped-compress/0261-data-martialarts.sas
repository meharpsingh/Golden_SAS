data martialarts;
input ntrophies nfirstplaces nyears nblackbelts npupils @@;
propfirst=nfirstplaces/ntrophies;
cards;
21 7  5 1 96  12 3  5 2 59  21 10 5  2 71   23 4  3  2 94   11 1  1 3 53
20 9  6 4 52  15 4  6 2 61  28 16 13 5 104  19 8  3  4 95   4  0  1 1 27
6  0  1 1 45  19 12 7 5 42  21 7  4  3 86   32 24 11 6 151  5  0  3 1 78
23 9  5 2 81  8  0  3 2 35  21 13 15 3 89   12 3  6  3 39   11 0  3 2 40
12 7  5 2 81  22 13 7 4 148 10 3  8  3 128  20 0  2  2 42   19 2  3 1 39
14 2  2 3 105
;
/*fitting zero-inflated beta regression model*/
proc nlmixed;
parms b0=0.1 b1=0.1 g0=0.1 g1=0.1 g2=0.1 phi=0.1;
pi0=exp(b0+b1*npupils)/(1+exp(b0+b1*npupils));
mu=exp(g0+g1*nyears+g2*nblackbelts)/(1+exp(g0+g1*nyears+g2*nblackbelts));
if(propfirst=0) then loglikelihood=log(pi0);
else loglikelihood=log(1-pi0)+lgamma(phi)-lgamma(mu*phi)-lgamma((1-mu)*phi)
+(mu*phi-1)*log(propfirst)+((1-mu)*phi-1)*log(1-propfirst);
model propfirst ~ general(loglikelihood);
run;
