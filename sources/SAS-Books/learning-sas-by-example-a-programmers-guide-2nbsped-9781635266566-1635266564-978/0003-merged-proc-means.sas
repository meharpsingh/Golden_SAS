/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0003-data-demographic.sas --- */
data Demographic;
  infile "C:\books\learning\Mydata.txt";
  input Gender $ Age Height Weight;
run;
title "Gender Frequencies";
proc freq data=Demographic;
   tables Gender;
run;

/* --- 0004-proc-means.sas --- */
proc means data=Demographic;
   var Age Height Weight;
run;
