      proc print data=reg&i(obs=10);
         var clinname sex edu ht wt;
         run;
      proc report data=reg&i
                  nowd;
         column clinname ht wt;
         define clinname / group;
         define ht / mean;
         define wt / mean;
         run;
      proc tabulate data=reg&i;
         class sex edu;
         var ht wt;
         table edu, sex*(ht wt)*(n mean stderr);
         run;
   %end;
%mend regionrpt;
