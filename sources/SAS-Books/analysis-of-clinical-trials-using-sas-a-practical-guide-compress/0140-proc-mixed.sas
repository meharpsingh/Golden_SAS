proc mixed data = growthav method = ml;
title 'Jennrich and Schluchter (MAR, Altern.), Model 1';
class sex idnr age;
model measure = sex age*sex / s;
repeated age / type = un subject = idnr r rcorr;
run;
