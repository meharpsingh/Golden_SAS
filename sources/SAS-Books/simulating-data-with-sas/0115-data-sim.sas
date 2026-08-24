data Sim;
set UnifData;
normal = quantile("Normal", x1);
lognormal = quantile("LogNormal", x2);
expo = quantile("Exponential", x3);
uniform = x4;
run;
