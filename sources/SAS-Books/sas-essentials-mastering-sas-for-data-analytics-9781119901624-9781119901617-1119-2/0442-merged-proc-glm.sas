/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0442-data-study.sas --- */
DATA STUDY;
INPUT SUBJ DRUG RESULT;
DATALINES;


;
DATA STUDY;
INPUT SUBJ DRUG RESULT;
DATALINES;


1 1 31


1 2 29


1 3 17


1 4 35


2 1 15


... etc


5 3 15


5 4 31


1 1 31
1 2 29
1 3 17
1 4 35
2 1 15
... etc
5 3 15
5 4 31


;
RUN;

/* --- 0443-proc-glm.sas --- */
PROC GLM DATA=STUDY;
     CLASS SUBJ DRUG;
     MODEL RESULT= SUBJ DRUG;
     MEANS DRUG/DUNCAN;
     TITLE 'Repeated Measures ANOVA';
RUN;
