proc mixed data=example2 2 2 method=ml;
class subject group visit;
model tbbmd=group group*years /noint solution;
random intercept years / type=un subject=subject;
estimate 'slope diff' group*years 1 -1;
run;
quit;
