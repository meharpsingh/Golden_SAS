data simul3;
       call streaminit(4321);/*Random seed generator*/
       do i=1 to 100; /*Number of Iteration*/
              Simnum =rand("normal"); /*Invoking the RAND functio
              output; /*To the values from each iteration*/
       end;
run;
/*Computing Simulation Statistics*/
proc univariate  data=simul3;
       Var  Simnum;
       histogram;
run;
