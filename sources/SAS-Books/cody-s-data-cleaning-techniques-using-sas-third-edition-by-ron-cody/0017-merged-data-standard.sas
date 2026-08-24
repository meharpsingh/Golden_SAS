/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0017-data-company.sas --- */
data Company;
   input Name $ 50.;
datalines;
International Business Machines
International Business Macnines, Inc.
IBM
Little and Sons
Little & Sons
Little and Son
MacHenrys
McHenrys


MacHenries
McHenry's
Harley Davidson
;

/* --- 0019-data-standard.sas --- */
data Standard;
   set Company;
   Standard_Name = put(Name,$Company.);
run;
title "Listing of Standard";
proc print data=Standard noobs;
run;
