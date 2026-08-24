proc genmod;
 model satisf = / dist=multinomial link=cumprobit;
run;
