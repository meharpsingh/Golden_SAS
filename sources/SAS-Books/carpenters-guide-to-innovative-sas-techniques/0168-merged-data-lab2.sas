/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0168-proc-sort.sas --- */
proc sort data=advrpt.lab_chemistry
           out=lab_chem
           noduplicates; ⎪
   by subject visit labdt; ⎨
   run;
proc contents data=lab_chem;
run;

/* --- 0169-data-lab2.sas --- */
data lab2(sortedby=subject visit);
   set lab_chem;
   run;
proc contents data=lab2;
   run;

/* --- 0170-proc-compare.sas --- */
proc compare
      data=lab_chem n
      compare=lab_chem2 n
      out=cmpr o
      outbase outcomp p
      noprint q
      outnoequal r;
   id subject visit labdt;
   run;
