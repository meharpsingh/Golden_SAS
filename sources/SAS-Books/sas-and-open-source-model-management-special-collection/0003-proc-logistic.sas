proc logistic data= train;
class bad;
model bad= debtinc ninq clage clno;
score data= production out=scores;
run;
