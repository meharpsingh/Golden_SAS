/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0144-data-original.sas --- */
  data Original;
input Name $ 30.;
  datalines;
  Jeffrey Smith
  Ron Cody
  Alan Wilson
  Alfred E. Newman
  ;
  data First_Last;
set Original;
length First Last $ 15;
First = scan(Name,1,' ');
Last = scan(Name,2,' ');
  run;

/* --- 0145-data-last.sas --- */
  data Last;
set Original;
length Last_Name $ 15;
Last_Name = scan(Name,-1,' ');
  run;
  proc sort data=Last;
by Last_Name;
  run;
  title "Alphabetical List of Names";
  proc print data=Last noobs;
var Name Last_Name;
  run;
