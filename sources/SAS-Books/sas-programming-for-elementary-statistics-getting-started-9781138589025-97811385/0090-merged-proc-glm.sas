/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0090-data-meat.sas --- */
DATA meat ;
INPUT Group $ pH CookYield @@;
DATALINES;
C  6.14  20.9  C  5.98  22.1
C  6.30  21.8  C  6.25  20.3
C  6.07  21.2  T1 5.98  22.4
T1 6.32  23.8  T1 5.89  23.0
T1 6.08  24.5  T1 6.11  22.8
T2 6.18  23.4  T2 6.22  20.8
T2 6.03  22.6  T2 5.97  24.8
T2 5.93  25.1
;

/* --- 0091-proc-glm.sas --- */
PROC GLM DATA=meat PLOTS(ONLY)=(RESIDUALS DIAGNOSTICS);
CLASS group;
MODEL cookyield = group;
MEANS group / CLM LSD;
TITLE "Objective 7.3 - ANOVA, CI's & Residuals";
RUN;

/* --- 0094-proc-npar1way.sas --- */
PROC NPAR1WAY DATA=meat WILCOXON ANOVA PLOTS=NONE;
CLASS Group ;
VAR CookYield ;
TITLE 'Objective 7.5';
RUN;
