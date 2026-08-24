proc catmod;
weight count;
response 0 .125 .25 .375 .5 .625 .75 .875 1;
model no_hours = center initial
treat(initial);
run;
