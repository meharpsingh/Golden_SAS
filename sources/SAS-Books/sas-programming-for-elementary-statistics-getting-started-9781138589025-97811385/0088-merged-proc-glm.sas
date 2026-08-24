/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0088-data-meat.sas --- */
DATA meat;
INPUT Group $ pH CookYield;
DATALINES;
C  6.14  20.9
C  5.98  22.1
C  6.30  21.8
C  6.25  20.3
C  6.07  21.2
T1 5.98  22.4
T1 6.32  23.8
T1 5.89  23.0
T1 6.08  24.5
TABLE 7.2
;

/* --- 0089-proc-glm.sas --- */
PROC GLM DATA=meat;
CLASS group;
MODEL ph cookyield = group;
MEANS group;
TITLE 'Objective 7.1 - ANOVA';
RUN;
QUIT;
