PROC DISCRIM DATA=MYDATA.BANK_TRAIN METHOD=NPAR K=9
       TESTDATA=MYDATA.BANK_TEST TESTOUT=SCORED ;
       CLASS TARGET;
       VAR &num_vars.;
RUN;
%INCLUDE 'C:/Users/James Gearheart/Desktop/SAS Book Stuff/Projects/separation.sas';
%separation(data = scored, score = '1'N, y = target);
