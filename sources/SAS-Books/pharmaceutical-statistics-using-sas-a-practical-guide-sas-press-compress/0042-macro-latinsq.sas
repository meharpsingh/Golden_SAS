%macro latinsq(n,seed);
proc plan seed=&seed;
factors animal_id=&n ordered period=&n ordered/noprint;
treatments group=&n cyclic;
output out=latin period random animal_id random group random;
proc tabulate data=latin formchar='
';
label animal_id="Animal ID" period="Period";
keylabel sum=' ';
class period animal_id;
var group;
table animal_id, period*(group=''*f=3.)/rts=8;
run;
%mend latinsq;
%latinsq(n=4,seed=1034567);
