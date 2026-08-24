/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0110-data-initial.sas --- */
data initial;
Parameter='eta b1i';Estimate=0; output;
Parameter='eta b2i';Estimate=0; output;
run;
data initial;
set SAStemp.peCRD initial;
run;

/* --- 0111-data-initial1.sas --- */
data initial1;
Parameter='eta Trt b1i';Estimate=0; output;
Parameter='eta Trt b2i';Estimate=0; output;
run;
data initial2;
set initial initial1;
run;
