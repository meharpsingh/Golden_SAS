/* Merged listing: this program was assembled from 5 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0101-data-base_reg.sas --- */
DATA base_reg;
  SET MYDATA.MODEL_TRAIN;
  WHERE 10 le revol_bal le 30000;
  sqrt_revol_bal = sqrt(revol_bal);
  DROP revol_bal;
RUN;

/* --- 0104-data-change.sas --- */
data change;
  set base_reg;
  sqrt_annual_inc = sqrt(annual_inc);
  sqrt_bc_util = sqrt(bc_util);
run;

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

/* --- 0114-proc-reg.sas --- */
%LET parsi_vars = sqrt_total_bc_limit sqrt_bc_util open_acc
     sqrt_loan_amnt sqrt_dti sqrt_annual_inc;
PROC REG DATA=change OUTEST=RegOut       ;
       MODEL sqrt_revol_bal = &parsi_vars. / SELECTION=STEPWISE;
       OUTPUT OUT=WORK.REG_PRED PREDICTED=P RESIDUAL=R;
RUN;
/*Apply parsimonious model to the TEST dataset*/
PROC SCORE DATA=test_reg SCORE=RegOut OUT=RScoreP TYPE=parms;
   VAR &parsi_vars.;
run;
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

/* --- 0116-proc-glmselect.sas --- */
PROC GLMSELECT DATA=change PLOTS(UNPACK)=ALL;
       MODEL sqrt_revol_bal = &trans. &box.
       / SELECTION=lasso(CHOOSE=CP) STATS=ALL;
       SCORE DATA=test_reg OUT=test_pred PREDICTED RESIDUAL;
RUN;
