/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0110-data-test_reg.sas --- */
DATA test_reg;
  SET MYDATA.MODEL_TEST;
  WHERE 10 le revol_bal le 30000;
  sqrt_revol_bal = sqrt(revol_bal);
  sqrt_annual_inc = sqrt(annual_inc);
  sqrt_bc_util = sqrt(bc_util);
  sqrt_dti = sqrt(dti);
  sqrt_loan_amnt = sqrt(loan_amnt);
  sqrt_mo_sin_old_il_acct = sqrt(mo_sin_old_il_acct);
  sqrt_mths_since_recent_bc = sqrt(mths_since_recent_bc);
  sqrt_pct_tl_nvr_dlq = sqrt(pct_tl_nvr_dlq);
  sqrt_tot_hi_cred_lim = sqrt(tot_hi_cred_lim);
  sqrt_total_bc_limit = sqrt(total_bc_limit);
  sqrt_total_rec_int = sqrt(total_rec_int);
RUN;

/* --- 0111-proc-score.sas --- */
PROC SCORE DATA=test_reg SCORE=RegOut OUT=RScoreP TYPE=parms;
   var sqrt_total_bc_limit;
RUN;
/*Calculate RMSE for the TEST dataset*/
DATA eval;
  SET RScoreP;
  RESIDUAL = (MODEL1-sqrt_revol_bal)**2;
  sqrt_residual = sqrt(residual);
  KEEP row_num model1 sqrt_revol_bal residual sqrt_residual;
RUN;
PROC MEANS DATA=eval N MEAN;
  VAR RESIDUAL sqrt_residual;
RUN;
