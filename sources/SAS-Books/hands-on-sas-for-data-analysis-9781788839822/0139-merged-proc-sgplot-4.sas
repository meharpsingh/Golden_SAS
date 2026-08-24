/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0139-data-class.sas --- */
Data Class;
Input ClassID $ Year Age Height Weight;
Grade = SYMGET (ClassID);
Datalines;
A1234 2013 8 85 34
A2323 2013 9 81 36
B3423 2013 8 80 31
B5324 2013 9 70 35
C2342 2013 9 80 31
D3242 2013 9 85 30
A1234 2019 14 105 64
A2323 2019 15 101 66
B3423 2019 14 100 61
B5324 2019 15 90 55
C2342 2019 15 112 70
D3242 2019 14 112 70
;

/* --- 0222-proc-means.sas --- */
Proc Means Data=Class Alpha=.05 CLM Mean Std NoPrint;
  Class Year;
  Var Height;
  Output Out=ClassMean UCLM=UCLM LCLM=LCLM Mean=Mean;
Run;

/* --- 0223-proc-sgplot.sas --- */
Proc SGPLOT Data=ClassMean;
  Vbarparm Category=Year Response=Mean / Datalabel;
Run;
