%let prob=0.5; /*Probability of Success*/
data simul1;
      call streaminit(4321);/*Random seed generator*/
      do i=1 to 100; /*Number of Iteration*/
             Simnum =rand("Bernoulli", &prob); /*Invoking the RAN
             output; /*To the values from each iteration*/
      end;
run;
/*Computing Simulation Statistics*/
ods graphics on;
proc freq  data=simul1;
      table Simnum/
             plots = freqplots;
run;
