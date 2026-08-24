/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0066-proc-reg.sas --- */
proc reg data=Clean.Banking(where=(Deposit is not missing)
   keep=Account Deposit Balance)
   plots(only label)=(diagnostics(unpack)
   residuals(unpack)
   rstudentbypredicted dffits fitplot observedbypredicted);
   id Account;
   model Deposit=Balance / influence;
   output out=Diagnostics rstudent=Rstudent cookd=Cook_D
                          dffits=DFfits;
   run;
quit;

/* --- 0068-data-influence.sas --- */
%let  N_Parameters=2;
data Influence;
   set Diagnostics nobs=N;
   Student=0;
   Cook=0;
   DF_fits=0;
   if abs(Rstudent gt 2) then Student=1;
   if Cook_D gt 4/N then Cook=1;
   if DFfits gt 2*sqrt(&N_Parameters/N) then DF_fits=1;
run;
