  DATA OLD1;
  INPUT SUBJ $ AGE YRS_SMOKE;
  datalines;
  001 34 12
  003 44 14
  004 55 35
  006 21 3
  ;
  DATA OLD2;
  INPUT SUBJECT $ SBP MARRIED;
  datalines;
  003 110 1
  001 120 .
  004 90 0
  006 100 1
  011 110 1


  ;
  RUN;
  Title "Results of INNER Join (1-to-1 merge)";
  PROC SQL;
        SELECT *
        FROM OLD1 INNER JOIN OLD2
        ON OLD1.SUBJ=OLD2.SUBJECT;
  QUIT;
