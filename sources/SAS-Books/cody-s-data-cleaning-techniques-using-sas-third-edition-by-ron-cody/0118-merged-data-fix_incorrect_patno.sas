/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0118-proc-sort.sas --- */
proc sort data=Clean.Patients out=Patients_No_Duprecs noduprecs;
   by Patno;
run;

/* --- 0119-data-fix_incorrect_patno.sas --- */
data Fix_Incorrect_Patno;
   set Patients_No_Duprecs;
   ***Correct duplicate patient numbers;
   if Patno='007' and Account_no='NJ90043' then Patno='102';
   else if Patno='050' and Account_No='NJ87682' then Patno='103';
   ***Correct incorrect and missing patient numbers;
   if Patno='XX5' then Patno='101';
   ***There was only one missing patient number;
   if missing(Patno) then Patno='104';
run;
proc sort data=Fix_Incorrect_Patno;
   by Patno;
run;
