/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0096-data-six.sas --- */
DATA six;
INPUT X Y Z ;
DATALINES;
89     25     41
47     33     37
73     27     37
66     25     29
50     42     37
;

/* --- 0097-proc-rank.sas --- */
PROC RANK DATA=six OUT=new6;
VAR x y z;
RANKS RX RY RZ;
PROC PRINT DATA=new6;
TITLE 'Objective 7.6';
RUN;
QUIT;
