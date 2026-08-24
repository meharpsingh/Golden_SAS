%macro BldRpt;
ods pdf file="&path\results\e11_4_3.pdf" r
        style=journal;
proc sql noprint; s
   select distinct edu
      into :edu1 - :edu99
         from advrpt.demog(keep=edu);
   %let educnt=&sqlobs;
   quit;
%do i = 1 %to &educnt; t
   ods pdf anchor="_&&edu&i"; u
   ods proclabel 'Symptom Summary'; v
   title3 "&&edu&i Years of Education";
   proc report data=advrpt.demog
                     (where=(edu=&&edu&i t))
               contents="_&&edu&i Years" w
               nowd;
      columns symp sex,wt;
      define symp / group;
      define sex  / across 'Gender';
      define wt   / analysis mean;
      run;
%end;
ods pdf close;
%mend bldrpt;
