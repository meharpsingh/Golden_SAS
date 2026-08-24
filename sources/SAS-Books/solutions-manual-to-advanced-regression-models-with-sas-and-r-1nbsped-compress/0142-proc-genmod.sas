proc genmod;
 model satisf = / dist=multinomial link=cumcll;
run;
