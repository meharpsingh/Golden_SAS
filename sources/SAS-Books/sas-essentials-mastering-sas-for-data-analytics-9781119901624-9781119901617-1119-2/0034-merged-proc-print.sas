/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0034-data-children.sas --- */
DATA CHILDREN;
* WT is in column 1-2, HEIGHT is in 4-5 and AGE is in 7-8;
* Create an INPUT statement that will read in this dataset;
INPUT      ;
DATALINES;


;
DATA CHILDREN;
* WT is in column 1-2, HEIGHT is in 4-5 and AGE is in 7-8;
* Create an INPUT statement that will read in this dataset;
INPUT      ;
DATALINES;


64 57 8


71 59 10


53 49 6


67 62 11


55 51 8


58 50 8


77 55 10


57 48 9


56 42 10


51 42 6


76 61 12


68 57 9


64 57 8
71 59 10
53 49 6
67 62 11
55 51 8
58 50 8
77 55 10
57 48 9
56 42 10
51 42 6
76 61 12
68 57 9


;
Title "Exercise 2.1 - your name";
PROC PRINT DATA=CHILDREN;
RUN;

/* --- 0035-proc-print.sas --- */
PROC PRINT DATA=CHILDREN;
RUN;
