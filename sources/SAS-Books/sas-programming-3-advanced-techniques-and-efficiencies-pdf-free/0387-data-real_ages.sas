data real_ages;
   do Birth_Date='28feb1960'd to '01mar1960'd;
      do Actual_Date='28feb2004'd to '01mar2004'd,
                       '28feb2005'd to '01mar2005'd;
         /* Calculate Real Age */
         Age=intck('year', Birth_Date, Actual_Date);
         output;
      end;
   end;
   format Birth_Date Actual_Date worddate.;
run;
proc print data=real_ages;
   var Birth_Date Actual_Date Age;
   title1 'Age Calculations based using INTCK';
run;
