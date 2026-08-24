/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0097-proc-freq.sas --- */
proc freq data=clean.patients noprint;
   tables Patno / out=Duplicates(keep=Patno Count
                             where=(Count gt 1));
run;

/* --- 0098-proc-sort.sas --- */
proc sort data=Clean.Patients out=Tmp;
   by Patno;
run;
proc sort data=Duplicates;
   by Patno;
run;
data Duplicate_Obs;
   merge Tmp Duplicates(in=In_Duplicates drop=Count);
   by Patno;
   if In_Duplicates;
run;
