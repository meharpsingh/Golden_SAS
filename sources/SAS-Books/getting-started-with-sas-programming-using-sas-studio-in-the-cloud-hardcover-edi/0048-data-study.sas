data Study;
   call streaminit(13579);
   do Subj = 1 to 10;
      Date = '01Jan2015'd + int(rand('uniform')*300);
      output;
   end;
   format Dates date9.;
run;
