proc logistic data= train;
class bad;
model bad= debtinc ninq clage clno;
code file= 'c:\temp\scorecode.sas';
run;
