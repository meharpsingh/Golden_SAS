data &CrucialErrRates;
set &Powers;
array PrNullFalseV{10} _temporary_ (&PriorPNullFalse);
beta = 1 - power;
iPNF = 1;
do until (PrNullFalseV{iPNF} = .);
gamma = PrNullFalseV{iPNF};
/* Compute Crucial Type I error rate */
TypeError = "Type
I";
CrucialRate
= alpha*(1 - gamma)/(alpha*(1 - gamma) + (1 - beta)*gamma);
output;
/* Compute Crucial Type II error rate */
TypeError = "Type II";
CrucialRate
= beta*gamma/(beta*gamma + (1 - alpha)*(1 - gamma));
output;
