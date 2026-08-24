proc reg data= train outest=model;
model bad= debtinc ninq clage clno;
output out=scores;
run ; quit ;
