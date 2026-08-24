/* Merged listing: this program was assembled from 9 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0108-data-base_reg.sas --- */
DATA base_reg;
  SET MYDATA.MODEL_TRAIN;
  WHERE 10 le revol_bal le 30000;
  sqrt_revol_bal =
sqrt(revol_bal);
  DROP revol_bal;
RUN;
PROC UNIVARIATE DATA=base_reg;
       VAR sqrt_revol_bal;
       HISTOGRAM;
RUN;

/* --- 0110-data-change.sas --- */
data change;
  set base_reg;
  sqrt_annual_inc =
sqrt(annual_inc);
  sqrt_bc_util = sqrt(bc_util);
run;

/* --- 0111-macro-loopit.sas --- */
%let trans = sqrt_annual_inc
sqrt_bc_util sqrt_dti
sqrt_loan_amnt
sqrt_mo_sin_old_il_acct
sqrt_mths_since_recent_bc
sqrt_pct_tl_nvr_dlq
sqrt_tot_hi_cred_lim
sqrt_total_bc_limit
sqrt_total_rec_int;
%MACRO loopit(mylist);
       %LET n =
%SYSFUNC(countw(&mylist));
       %DO I=1 %TO &n;
              %LET val =
%SCAN(&mylist,&I);
                     proc sgplot
data=change (obs=5000);
                       SCATTER
X=&val.
Y=sqrt_revol_bal;
                     RUN;
       %END;
%MEND;
%LET list = &trans.;
%loopit(&list);

/* --- 0112-macro-loopit.sas --- */
%let box = acc_open_past_24mths
app_individual app_joint emp_10
emp_0to4 emp_5to9 emp_NA grade_A
grade_B grade_C grade_D grade_E
grade_F grade_G home_mort home_own
home_rent    inq_last_6mths
int_rate mo_sin_rcnt_tl
months_since_issue mort_acc
mths_since_recent_inq
num_actv_bc_tl num_bc_tl open_acc
purpose_cc purpose_dc purpose_hi
purpose_other recoveries term_36
term_60 ver_not ver_source
ver_verified;
%MACRO loopit(mylist);
       %LET n =
%SYSFUNC(countw(&mylist));
       %DO I=1 %TO &n;
              %LET val =
%SCAN(&mylist,&I);
proc sort data=change
(keep=sqrt_revol_bal &val.)
out=out; by &val.;
              proc boxplot
data=out ;
                     plot
sqrt_revol_bal*&val.;

/* --- 0114-proc-reg.sas --- */
ODS GRAPHICS ON;
PROC REG DATA=change (obs=5000)
       PLOTS(ONLY)=ALL;
       MODEL sqrt_revol_bal =
sqrt_total_bc_limit /
              SLE=0.1
              SLS=0.1
              INCLUDE=0;
       OUTPUT OUT=WORK.REG_PRED
PREDICTED=P RESIDUAL=R;
RUN;

/* --- 0115-proc-reg.sas --- */
PROC REG DATA=change
OUTEST=RegOut;
       MODEL sqrt_revol_bal =
sqrt_total_bc_limit
/ SELECTION=STEPWISE;
       OUTPUT OUT=WORK.REG_PRED
PREDICTED=P RESIDUAL=R;
RUN;

/* --- 0119-proc-reg.sas --- */
ODS GRAPHICS ON;
PROC REG DATA=change (obs=5000)
PLOTS(ONLY)=ALL;
       MODEL sqrt_revol_bal =
&trans. &box. / SELECTION=STEPWISE
       SLE=0.1 SLS=0.1 INCLUDE=0
COLLIN VIF;
       OUTPUT OUT=WORK.REG_PRED
PREDICTED=P RESIDUAL=R;
RUN;

/* --- 0120-proc-reg.sas --- */
ODS GRAPHICS ON;
PROC REG DATA=change (obs=5000)
PLOTS(ONLY)=ALL;
       MODEL sqrt_revol_bal =
sqrt_total_bc_limit sqrt_bc_util
               open_acc
sqrt_loan_amnt sqrt_dti
               sqrt_annual_inc
sqrt_pct_tl_nvr_dlq home_mort
 acc_open_past_24mths
num_actv_bc_tl
          / SELECTION=STEPWISE
              SLE=0.1
              SLS=0.1
              INCLUDE=0
              COLLIN VIF;
       OUTPUT OUT=WORK.REG_PRED
PREDICTED=P RESIDUAL=R;
RUN;

/* --- 0123-proc-reg.sas --- */
ODS GRAPHICS ON;
PROC REG DATA=change OUTEST=b
RIDGE=0 to 1 by .05
       PLOTS(ONLY)=ALL       ;
       MODEL sqrt_revol_bal =
&trans. &box.;
       OUTPUT OUT=WORK.RIDGE_PRED
PREDICTED=P RESIDUAL=R;
RUN;
