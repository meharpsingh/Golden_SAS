DATA loopex2 loopex3;
DO trt=1 TO 6;
  DO rep = 1 TO 2;
    INPUT y @@;
    y_log = log(y);
    IF trt <= 3 THEN OUTPUT loopex2;
    ELSE OUTPUT loopex3;
  END;
END;
DATALINES;
12 14 18 16 12 11 17 19 20 11 13 15
;
PROC PRINT DATA=loopex2;
TITLE 'Objective 15.3 - Trt 1, 2, 3 Data';
PROC PRINT DATA=loopex3;
TITLE 'Objective 15.3 - Trt 4, 5, 6 Data';
RUN;
QUIT;
