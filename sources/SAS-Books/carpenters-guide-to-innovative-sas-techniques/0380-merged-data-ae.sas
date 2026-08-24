/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0380-data-a.sas --- */
data a;
   abcdefghig= 5;
   run;
option validvarname=any;
PROC IMPORT OUT= WORK.AeXLS
            DATAFILE= "&path\data\E14_1_2AE.xls"
            DBMS=EXCEL REPLACE;
     SHEET="Sheet1$";
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;
options validvarnames=any;
proc print data=aexls;
  var subject 'ae-date'n 'ae#type'n;
  run;

/* --- 0381-data-ae.sas --- */
data ae;
   set aexls(rename=('ae-date'n=AEDate
                     'ae#type'n=AEType));
   run;
proc optsave out=advrpt.current_settings;
   run;
