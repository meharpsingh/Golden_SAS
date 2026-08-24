DATA loopex1;
DO trt=1 TO 6;
  DO rep = 1 TO 2;
    INPUT y @@;
    OUTPUT;
  END;
END;
DATALINES;
12 14 18 16 12 11 17 19 20 11 13 15
;
*The PRINT procedure can be omitted if ViewTable is used.;
PROC PRINT DATA=loopex1;
TITLE 'Objective 15.1 - With OUTPUT Statement';
RUN;
QUIT;
