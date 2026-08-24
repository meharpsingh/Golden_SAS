 DATA KAPPA;
 INPUT RATER1 RATER2 WT;
 DATALINES;


;
 DATA KAPPA;
 INPUT RATER1 RATER2 WT;
 DATALINES;


 1   1   75


 1   2   1


 1   3   4


 2   1   5


 2   2   4


 2   3   1


 3   1   0


 3   2   0


 3   3   10


 1   1   75
 1   2   1
 1   3   4
 2   1   5
 2   2   4
 2   3   1
 3   1   0
 3   2   0
 3   3   10


 ;
 PROC FREQ;
    WEIGHT WT;
    TABLE RATER1*RATER2 / AGREE; TEST KAPPA;
    TITLE 'KAPPA EXAMPLE FROM FLEISS';
 RUN;
