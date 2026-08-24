/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0480-macro-cntmales.sas --- */
%macro cntmales;
   %local cntmales; ➊
   data malesonly;
      set macro3.clinics end=eof;
      if sex='M' then do;
         cnt+1;
         output malesonly;
      end;
      if eof then call symputx('cntmales',cnt);
%mend cntmales;
%cntmales
title "Number of Males is &cntmales";  ➋
proc print data=malesonly(obs=5);
   var lname fname sex;
   run;

/* --- 0481-proc-print.sas --- */
proc print data=malesonly(obs=5);
   var lname fname sex;
   title "Number of Males is &cntmales"; ➌
   run;
