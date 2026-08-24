/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0246-data-repmixed.sas --- */
  DATA REPMIXED(KEEP= SUBJECT GENDER TIME OUTCOME);
  INPUT SUBJECT GENDER $ HOUR1-HOUR4;
  OUTCOME = HOUR1;  TIME = 1; OUTPUT;
  OUTCOME = HOUR2;  TIME = 2; OUTPUT;
  OUTCOME = HOUR3;  TIME = 3; OUTPUT;
  OUTCOME = HOUR4;  TIME = 4; OUTPUT;
  DATALINES;
  1  M  1    1.5  6    5.1
  2  M  4    2.2  6.1  5.2
  3  M  5.2  4.1  5.8  3.2
  4  F  5.1  3.3  5.2  4.8
  5  F  6.3  4.9  7.9  6.9
  6  F  8.2  5.9  9.5  9.1
  7  F  8.3  6.1  9.2
  ;

/* --- 0247-proc-mixed.sas --- */
   PROC MIXED DATA=REPMIXED;
          CLASS GENDER TIME SUBJECT;
          MODEL OUTCOME=GENDER TIME GENDER*TIME;
          REPEATED / TYPE=UN SUB=SUBJECT;
   RUN;
   PROC MIXED DATA=REPMIXED;
          CLASS GENDER TIME SUBJECT;
          MODEL OUTCOME=GENDER TIME GENDER*TIME;
          REPEATED / TYPE=CS SUB=SUBJECT;
   RUN;
   PROC MIXED DATA=REPMIXED;
          CLASS GENDER TIME SUBJECT;
          MODEL OUTCOME=GENDER TIME GENDER*TIME;
          REPEATED / TYPE=AR(1) SUB=SUBJECT;
   RUN;

/* --- 0248-proc-sort.sas --- */
   PROC SORT DATA=REPMIXED;BY GENDER TIME;
   PROC MEANS noprint; BY GENDER TIME;
        OUTPUT OUT=FORPLOT MEAN=;
   RUN;
   PROC GPLOT;
   PLOT OUTCOME*GENDER=TIME;
   SYMBOL1 V=CIRCLE I=JOIN L=1 C=BLACK;
   SYMBOL2 V=DOT I=JOIN L=2 C=BLUE;
   SYMBOL3 V=STAR I=JOIN L=2 C=RED;
   SYMBOL4 V=SQUARE I=JOIN L=2 C=GREEN;
   RUN;
   PROC SORT DATA=REPMIXED;BY TIME GENDER;
   PROC MEANS noprint; BY TIME GENDER;
      OUTPUT OUT=FORPLOT MEAN=;
   RUN;
   PROC GPLOT;
   PLOT OUTCOME*TIME=GENDER;
   SYMBOL1 V=CIRCLE I=JOIN L=1 C=BLACK;
   SYMBOL2 V=DOT I=JOIN L=2 C=BLUE;
   RUN;
