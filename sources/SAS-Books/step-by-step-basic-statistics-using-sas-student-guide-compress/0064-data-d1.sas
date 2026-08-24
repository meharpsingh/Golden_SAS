          OPTIONS  LS=80  PS=60;
          DATA D1;
             INPUT  SUB_NUM
                    RECALL;
          DATALINES;
          01  31
          02  34
          03  26
          04  36
          05  31
          06  30
          07  29
          08  30
          09  34
          10  28
          11  28
          12  30
          13  33
          ;
          PROC TTEST  DATA=D1  H0=25  ALPHA=0.05;
             VAR RECALL;
             TITLE1  'JOHN DOE';
          RUN;
