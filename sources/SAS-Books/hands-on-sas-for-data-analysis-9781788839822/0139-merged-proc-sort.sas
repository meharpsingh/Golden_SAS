/* Merged listing: this program was assembled from 9 consecutive listings in the same book,
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

/* --- 0215-proc-sort.sas --- */
Proc Sort Data = Class Out=Delta;
  By ClassID Year Height;
Run;

/* --- 0217-proc-sgplot.sas --- */
Proc SGPLOT Data=Class;
  VBar Height;
  Title ' Basic Form of Vertical Chart';
Run;

/* --- 0218-proc-sgplot.sas --- */
Proc SGPLOT Data=Class;
  VBar Height / Dataskin=Gloss Stat=PCT;
  Title 'Vertical Gloss Chart with PCT';
Run;

/* --- 0219-proc-sgplot.sas --- */
Proc SGPLOT Data=Class;
  VBar Height / Dataskin=Sheen Barwidth=0.5;
  Title 'Vertical Sheen Chart with Spread Out Bars';
Run;

/* --- 0220-proc-sgplot.sas --- */
Proc SGPLOT Data=Class;
  VBar Height / Datalabel Datalabelattrs=(family='Albany AMT'
  size=10pt color=red);
  Title 'Chart with Datalabel';
Run;

/* --- 0221-proc-sgplot.sas --- */
Proc SGPLOT Data=Class;
  VBar Height / Datalabel Datalabelattrs=(Family='Albany AMT'
  Size=10pt Color=Red)
  Fillattrs=(Color=Blue) Filltype=Gradient;
  Title 'Chart with Color and Gradient';
Run;

/* --- 0222-proc-means.sas --- */
Proc Means Data=Class Alpha=.05 CLM Mean Std NoPrint;
  Class Year;
  Var Height;
  Output Out=ClassMean UCLM=UCLM LCLM=LCLM Mean=Mean;
Run;

/* --- 0224-proc-sgplot.sas --- */
Proc SGPLOT Data=Class;
  Vbar Year / Response = Height Stat=Mean Limits=Upper
  Datalabel;
  Title 'Alternative Method for Charting Statistical Output';
Run;
