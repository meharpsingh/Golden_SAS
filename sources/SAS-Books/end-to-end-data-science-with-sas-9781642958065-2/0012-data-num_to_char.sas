DATA num_to_char;
  SET MYDATA.LOAN_LIMIT (KEEP=loan_amnt);
  char_loan = put(loan_amnt, $8.);
  DROP loan_amnt;
RUN;
DATA char_to_num;
  SET num_to_char;
  num_loan = input(char_loan, 8.);
  DROP char_loan;
RUN;
  date = datepart(datetime);
  time = timepart(datetime);
DATA date_values;
  SET dataset;
  year  = year(date);
  month = month(date);
  day   = day(date);
  week  = week(date);
RUN;
DATA new_features;
  SET MYDATA.LOAN_LIMIT (KEEP=installment annual_inc int_rate term);
  /*Create new variable: debt to income ratio*/
  dti = installment / (annual_inc / 12);
  /*Polynomial*/
  int_rate_sq = int_rate**2;
  /*Dummy variables*/
  IF term = '36 months' THEN t36 = 1; ELSE t36 = 0;
  IF term = '60 months' THEN t60 = 1; ELSE t60 = 0;
RUN;
  log_income = log(annual_inc);
PROC STDIZE DATA=MYDATA.Loan_limit(KEEP=annual_inc int_rate)
       METHOD=STD OUT=std_vars;
       VAR annual_inc int_rate;
RUN;
PROC HPBIN DATA=MYDATA.BASE (KEEP=total_pymnt) NUMBIN=10;
       INPUT total_pymnt ;
       ODS OUTPUT MAPPING=MAPPING;
RUN;
PROC HPBIN DATA=MYDATA.BASE (KEEP=bad total_pymnt)
       WOE BINS_META=MAPPING;
       TARGET BAD / LEVEL=BINARY ORDER=DESC;
RUN;
/*Create initial simple linear regression model*/
PROC REG DATA=example;
  MODEL Y=X;
  OUTPUT OUT=pred RESIDUAL=RESID;
RUN;
/*Create the absolute value of the residuals*/
DATA abs_resid;
  SET pred;
  absresid = ABS(RESID);
RUN;
/*Create another simple linear regression model*/
/*Regress X on the absolute value of the residuals*/
PROC REG DATA=abs_resid;
  MODEL absresid = X;
  OUTPUT OUT=abs_weights PREDICTED=abs_hat;
RUN;
/*Compute weights using estimated standard deviations*/
DATA weights;
  SET abs_weights;
  weight = 1/(abs_hat**2);
RUN;
PROC UNIVARIATE DATA=MYDATA.BASE; VAR revol_bal; HISTOGRAM; RUN;
DATA base_reg;
  SET MYDATA.MODEL_TRAIN;
  WHERE 10 le revol_bal le 30000;
RUN;
PROC UNIVARIATE DATA=base_reg;
       VAR revol_bal;
       HISTOGRAM;
RUN;
DATA base_reg;
  SET MYDATA.MODEL_TRAIN;
  WHERE 10 le revol_bal le 30000;
  sqrt_revol_bal = sqrt(revol_bal);
  DROP revol_bal;
RUN;
PROC UNIVARIATE DATA=base_reg;
       VAR sqrt_revol_bal;
       HISTOGRAM;
RUN;
%let cont = annual_inc bc_util dti loan_amnt mo_sin_old_il_acct mths_since_recent_bc pct_tl_nvr_dlq tot_hi_cred_lim        total_bc_limit total_rec_int;
%MACRO loopit(mylist);
       %LET n = %SYSFUNC(countw(&mylist));
       %DO I=1 %TO &n;
              %LET val = %SCAN(&mylist,&I);
                     proc sgplot data=base_reg (obs=5000);
                       SCATTER X=&val.
                                   Y=sqrt_revol_bal;
                     RUN;
       %END;
%MEND;
%LET list = &cont.;
%loopit(&list);
data change;
  set base_reg;
  sqrt_annual_inc = sqrt(annual_inc);
  sqrt_bc_util = sqrt(bc_util);
run;
%let trans = sqrt_annual_inc sqrt_bc_util sqrt_dti sqrt_loan_amnt sqrt_mo_sin_old_il_acct sqrt_mths_since_recent_bc sqrt_pct_tl_nvr_dlq sqrt_tot_hi_cred_lim sqrt_total_bc_limit         sqrt_total_rec_int;
%MACRO loopit(mylist);
       %LET n = %SYSFUNC(countw(&mylist));
       %DO I=1 %TO &n;
              %LET val = %SCAN(&mylist,&I);
                     proc sgplot data=change (obs=5000);
                       SCATTER X=&val.
                                       Y=sqrt_revol_bal;
                     RUN;
       %END;
%MEND;
%LET list = &trans.;
%loopit(&list);
%let box = acc_open_past_24mths app_individual app_joint emp_10 emp_0to4 emp_5to9 emp_NA grade_A grade_B grade_C grade_D grade_E grade_F grade_G home_mort home_own home_rent    inq_last_6mths int_rate mo_sin_rcnt_tl months_since_issue mort_acc mths_since_recent_inq num_actv_bc_tl num_bc_tl open_acc purpose_cc purpose_dc purpose_hi purpose_other recoveries term_36 term_60 ver_not ver_source ver_verified;
%MACRO loopit(mylist);
       %LET n = %SYSFUNC(countw(&mylist));
       %DO I=1 %TO &n;
              %LET val = %SCAN(&mylist,&I);
proc sort data=change (keep=sqrt_revol_bal &val.) out=out; by &val.;
              proc boxplot data=out ;
                     plot sqrt_revol_bal*&val.;
