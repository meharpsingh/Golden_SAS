 PROC CORR DATA="C:\SASDATA\SOMEDATA";
      VAR TIME1-TIME4;
      WITH AGE;
 TITLE "Example correlation calculations using a WITH statement";
 RUN;
