data imports;
retain dlmvar '/,'; s
infile cards dlm=dlmvar;
input id importcode $ value;
cards;
14,1,13
25/Q9,15
6,D/20
;
run;
data imports;
infile cards dlmstr=',,/';
input  id importcode $ value;
cards;
14,,/1/,,/13
25,,/Q9,,,/15
6,,/,D,,/20
;
run;
