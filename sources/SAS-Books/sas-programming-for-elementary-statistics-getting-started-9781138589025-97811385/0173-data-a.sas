DATA a;
r = 16;;
DO UNTIL (r=20);
      r+1;
      OUTPUT;
END;
PROC PRINT DATA=a;
RUN;
QUIT;
