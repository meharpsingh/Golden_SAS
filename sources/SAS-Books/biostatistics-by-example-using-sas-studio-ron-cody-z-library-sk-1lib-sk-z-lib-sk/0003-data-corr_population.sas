data Corr_Population;
   call streaminit(12345);
   do i = 1 to 1000;
      X = ceil(rand('uniform')*100);
      Y = ceil(rand('uniform')*100);
      output;
   end;
   drop i;
run;
