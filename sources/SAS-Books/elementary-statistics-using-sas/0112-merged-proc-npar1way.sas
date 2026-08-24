/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0112-data-gastric.sas --- */
data gastric;
   input group $ lysolevl @@;
   datalines;
U 0.2 U 10.4 U 0.3 U 10.9 U 0.4 U 11.3 U 1.1 U 12.4 U 2.0
U 16.2 U 2.1 U 17.6 U 3.3 U 18.9 U 3.8 U 20.7 U 4.5
U 24.0 U 4.8 U 25.4 U 4.9 U 40.0 U 5.0 U 42.2 U 5.3
U 50.0 U 7.5 U 60.0 U 9.8
N 0.2 N 5.4 N 0.3 N 5.7 N 0.4 N 5.8 N 0.7 N 7.5 N 1.2 N 8.7
N 1.5 N 8.8 N 1.5 N 9.1 N 1.9 N 10.3 N 2.0 N 15.6 N 2.4
N 16.1 N 2.5 N 16.5 N 2.8 N 16.7 N 3.6 N 20.0
N 4.8 N 20.7 N 4.8 N 33.0
;
run;
proc npar1way data=gastric wilcoxon;
   class group;
   var lysolevl;
   title 'Comparison of Ulcer and Control Patients';
run;

/* --- 0113-proc-npar1way.sas --- */
ods select wilcoxontest;
proc npar1way data=gastric wilcoxon;
   class group;
   var lysolevl;
run;
