/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0126-data-air.sas --- */
DATA air;
 SET sashelp.air;
 lag_air = LAG(air);
 dif_air = DIF(air);
 lag2_air = LAG2(air);
RUN;

/* --- 0129-data-air_missing.sas --- */
DATA air_missing;
 SET sashelp.air;
 IF uniform(23) < 0.1 THEN air = .;
RUN;

/* --- 0130-proc-expand.sas --- */
PROC EXPAND DATA = air_missing OUT = air_impute;
 CONVERT air / OBSERVED = total;
RUN;
