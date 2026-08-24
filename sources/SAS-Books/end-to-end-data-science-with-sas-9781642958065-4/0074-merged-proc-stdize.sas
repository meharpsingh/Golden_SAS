/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0074-proc-stdize.sas --- */
PROC STDIZE DATA=MYDATA.LOAN_LIMIT REPONLY METHOD=mean
OUT=Complete_data; VAR _NUMERIC_;
RUN;

/* --- 0075-proc-stdize.sas --- */
%let outliers = annual_inc total_rev_hi_lim tot_hi_cred_lim
tot_cur_bal tot_coll_amt total_bal_ex_mort total_il_high_credit_limit total_bc_limit avg_cur_bal
bc_open_to_buy delinq_amnt tot_coll_amt;
PROC STDIZE DATA=MYDATA.LOAN_LIMIT (keep=ROW_NUM &outliers.)
       REPONLY METHOD=median OUT=Outlier_adjust;
       VAR _NUMERIC_;
RUN;
DATA MYDATA.LOAN_ADJUST;
MERGE Complete_data (drop= &outliers. in=a) Outlier_adjust (in=b);
       by ROW_NUM;
RUN;
