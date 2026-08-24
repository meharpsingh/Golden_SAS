/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0069-data-kernel.sas --- */
data kernel;
set kernel;
   width = 0.18593;
   prob = density * width;
   y_guarantee = 152;
   if value > (.75 * y_guarantee) then prob = .;
   uno = 1;
run;
proc means sum noprint;
   by uno;
   var prob;
   output out = probsum sum = prob_sum;
run;
data kernel;
merge kernel probsum;
by uno;
   e_y_75 = value * prob / prob_sum;
   if value > (.75 * y_guarantee) then e_y_75 = .;
run;
proc means sum noprint;
   by uno;
   var e_y_75;
   output out = exsum sum = e_y_75_sum;
run;

/* --- 0070-data-kderates.sas --- */
data kderates;
   merge probsum exsum;
   by uno;
   liab = 2.50 * .75 * 152;
   e_loss = prob_sum * (liab - 2.50 * e_y_75_sum);
   rate_kernel = e_loss / liab;
run;
