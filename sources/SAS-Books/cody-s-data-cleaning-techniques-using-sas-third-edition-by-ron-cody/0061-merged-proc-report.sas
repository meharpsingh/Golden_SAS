/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0061-data-outliers.sas --- */
data Outliers;
   merge Clean.Banking(keep=Account Deposit
         where=(Deposit is not missing))
         By_Account(In=In_By_Account);
   by Account;
   if In_By_Account;
   if Deposit lt Deposit_Q1 - 1.5*Deposit_QRange or
      Deposit gt Deposit_Q3 + 1.5*Deposit_QRange then output;
run;

/* --- 0062-proc-report.sas --- */
proc report data=Outliers headline;
   columns Account Deposit Deposit_Median Deposit_QRange;
   define Account / order "Account Number" width=7;
   define Deposit / Format=dollar12.2;
   define Deposit_Median / "Median" Format=dollar12.2;
   define Deposit_QRange / "Interquartile Range" width=13;
run;

/* --- 0063-proc-sort.sas --- */
proc sort data=Outliers(keep=Account) nodupkey out=Single;
   by Account;
run;
Data Plot_Data;
   merge Single(in=In_Single)
         Clean.Banking(keep=Account Deposit
                       where=(Deposit is not missing));
   by Account;
   if In_Single;
run;
