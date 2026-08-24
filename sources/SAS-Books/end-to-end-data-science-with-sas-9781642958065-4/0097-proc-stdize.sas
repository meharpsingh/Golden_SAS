PROC STDIZE DATA=MYDATA.Loan_limit(KEEP=annual_inc int_rate)
       METHOD=STD OUT=std_vars;
       VAR annual_inc int_rate;
RUN;
