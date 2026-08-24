%let smean=0.0067658;
%let ssd = 0.04465726;
data simul4 (keep=i simnum);
      call streaminit(4321);/*Random seed generator*/
      do i=1 to 1000; /*Number of Iteration*/
             Simnum =rand("normal",&smean,&ssd); /*Invoking the R
             output; /*To the values from each iteration*/
      end;
run;
/*Computing Simulation Statistics*/
proc univariate  data=simul4;
      Var  Simnum;
      histogram / normal kernel;
run;
