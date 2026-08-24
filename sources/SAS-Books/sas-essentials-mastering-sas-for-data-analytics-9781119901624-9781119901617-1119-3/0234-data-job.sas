 DATA JOB;
 INPUT SUBJECT $ TEST1 TEST2 TEST3 TEST4 JOBSCORE;
 DATALINES;
    1         75     100      90      88      78
    2         51      85      88      89      71
    3         99      96      94      93      85
    4         92     106      84      84      67
    5         90      89      83      77      69
    6         67      77      83      73      65
    7        109      67      71      65      50
    8         94     112     105      91     107
    9        105     110      99      95      96
   10         74     102      88      69      63
 ;
 PROC REG;
 MODEL JOBSCORE=TEST3;
 TITLE 'Job Score Final Model';
 RUN;
 DATA NEWAPPS;
       INPUT SUBJECT $ TEST3;
 DATALINES;
 101 79
 102 87
 103 98
 104 100
 105 49
 106 88
 107 91
 108 79
 109 84
 110 87
    ;
 DATA REPORT; SET JOB NEWAPPS;
 PREDICT_ID=CATS(SUBJECT,": ",TEST3);
 RUN;
 PROC REG DATA=REPORT;
      ID PREDICT_ID;
      MODEL JOBSCORE=TEST3 /P CLI;
 RUN;
 QUIT;
