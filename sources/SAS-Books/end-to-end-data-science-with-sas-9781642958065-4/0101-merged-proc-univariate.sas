/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0101-data-base_reg.sas --- */
DATA base_reg;
  SET MYDATA.MODEL_TRAIN;
  WHERE 10 le revol_bal le 30000;
  sqrt_revol_bal = sqrt(revol_bal);
  DROP revol_bal;
RUN;

/* --- 0102-proc-univariate.sas --- */
PROC UNIVARIATE DATA=base_reg;
       VAR sqrt_revol_bal;
       HISTOGRAM;
RUN;

/* --- 0103-macro-loopit.sas --- */
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

/* --- 0104-data-change.sas --- */
data change;
  set base_reg;
  sqrt_annual_inc = sqrt(annual_inc);
  sqrt_bc_util = sqrt(bc_util);
run;
