/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0357-data-portfolio.sas --- */
data portfolio;
   infile 'c:\books\learning\stocks.txt';
   input Symbol $ Price Number;
   Value = Number*Price;
run;
title "Listing of Portfolio";
proc print data=portfolio noobs;
run;

/* --- 0358-proc-means.sas --- */
proc means data=portfolio n mean sum maxdec=0;
   var Price Number;
run;
*2-3;
/*
   EMF = 1.45*V + (R/E)*v**3 - 125;
*/
*2-5;
 /*need $ after Gender*/
data XYZ;
   infile "c:\books\learning\DataXYZ.txt";
   input Gender $ X Y Z;
   Sum = X + y + Z;
datalines;
Male 1 2 3
Female 4 5 6
Male 7 8 9
;
run;
