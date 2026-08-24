data imports;
infile cards dlm='/,';
input id importcode $ value;
cards;
14,1,13
25/Q9,15
6,D/20
;
run;
