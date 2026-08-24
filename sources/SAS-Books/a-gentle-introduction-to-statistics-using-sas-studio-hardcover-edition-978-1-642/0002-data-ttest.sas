data TTest;
   call streaminit(13579);
   do Subj = 1 to 10;
      Do Group = 'A','B';
         X = round(rand('normal',100,15) + 10*(Group = 'B'));
         output;
      end;
   end;
run;
