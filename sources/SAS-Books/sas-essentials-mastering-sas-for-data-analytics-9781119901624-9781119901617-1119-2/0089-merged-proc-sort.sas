/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0089-data-mydata.sas --- */
DATA MYDATA;
INPUT GROUP RECTIME;
DATALINES;


;
DATA MYDATA;
INPUT GROUP RECTIME;
DATALINES;


1    4.2


2    3.6


2    3.1


1    2.1


1    2.8


2    1.5


1    1.8


1    4.2
2    3.6
2    3.1
1    2.1
1    2.8
2    1.5
1    1.8


;
PROC SORT DATA=MYDATA OUT=S1; BY RECTIME;
Title 'Sorting Example - Ascending';
PROC PRINT DATA=S1;
RUN;

/* --- 0090-proc-sort.sas --- */
PROC SORT DATA=MYDATA OUT=S1; BY RECTIME;
Title 'Sorting Example - Ascending';
PROC PRINT DATA=S1;
RUN;
