/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0211-proc-summary.sas --- */
proc summary data=advrpt.lab_chemistry;
   var potassium;
   output out=stats
          p1=  n
          p99= /autoname;
   run;
data chkoutlier;
   set stats(keep=potassium_p1 potassium_p99); o
   do until (done);
      set advrpt.lab_chemistry o
                (keep=subject visit potassium)
          end=done; p

/* --- 0212-proc-print.sas --- */
options nobyline; s
proc print data=chkoutlier;
 by potassium_p1 potassium_p99; t
 title2 'Potassium 1% Bounds are #byval1, #byval2'; u
 run;
