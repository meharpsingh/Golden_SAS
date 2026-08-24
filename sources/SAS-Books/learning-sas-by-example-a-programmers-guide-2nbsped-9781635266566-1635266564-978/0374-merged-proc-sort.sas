/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0374-data-demographic_id.sas --- */
data demographic_ID;
   set learn.demographic_ID(rename=(ID = CharID));
   ID = input(CharID,3.);
   drop CharID;
run;
proc sort data=demographic_ID;
   by ID;

/* --- 0375-proc-sort.sas --- */
proc sort data=learn.survey2 out=survey2;
   by ID;
run;
data combine;
   merge demographic_ID
         survey2;
   by ID;
run;
title "Listing of COMBINE";
proc print data=combine noobs;
run;
