proc glimmix data=neurodeg;
   class dose id;
   model resp= dose*time/solution COVB ;
   random intercept time / type=UN subject=id;
   estimate &modcontr. / adjust=simulate(nsamp=1000000 seed=1) uppertailed;
run;
