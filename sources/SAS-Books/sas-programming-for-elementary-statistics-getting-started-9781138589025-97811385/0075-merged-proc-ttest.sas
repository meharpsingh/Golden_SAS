/* Merged listing: this program was assembled from 6 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0075-data-instruction.sas --- */
DATA instruction;
INPUT program $ score @@;
DATALINES;
A 71 A 82 A 88 A 64 A 59 A 78 A 72
A 81 A 83 A 66 A 83 A 91 A 79 A 70
B 65 B 88 B 92 B 76 B 87 B 89 B 85
B 90 B 81 B 91 B 78 B 81 B 86 B 82
B 73 B 79
;

/* --- 0076-proc-ttest.sas --- */
PROC TTEST DATA=instruction H0=75;
VAR score;
TITLE 'Objective 6.1';
RUN;

/* --- 0077-proc-ttest.sas --- */
PROC TTEST DATA= instruction H0=75 ALPHA=0.02 PLOTS=NONE;
VAR score;
TITLE 'Objective 6.2';
RUN;

/* --- 0078-proc-sort.sas --- */
PROC SORT DATA= instruction; BY program;
PROC TTEST DATA= instruction PLOTS=NONE H0=75 ALPHA=0.02 SIDES=U;
BY program;
VAR score;
TITLE 'Objective 6.3';
RUN;

/* --- 0079-proc-ttest.sas --- */
PROC TTEST DATA= instruction SIDES=2  ALPHA=0.05 H0=75;
VAR score;
RUN;

/* --- 0080-proc-univariate.sas --- */
PROC UNIVARIATE DATA= instruction ALPHA=0.05 CIBASIC MU0=75;
VAR score;
RUN;
