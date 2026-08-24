DATA X;
       DO i = 1 to 10 BY 2 WHILE
(y < 15);
              y = i*2;
              OUTPUT;
       END;
RUN;
