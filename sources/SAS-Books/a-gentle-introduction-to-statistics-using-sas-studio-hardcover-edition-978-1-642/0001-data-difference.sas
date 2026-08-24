data Difference;
   call streaminit(13579);
   do Subj = 1 to 20;
      Diff = .6 - rand('uniform');
      output;
   end;
run;
