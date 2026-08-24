/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0092-data-eer.sas --- */
data EER;
group = "UCO";
CellWgt = 1;
meanlog2EER_a = log2(2.0);
meanlog2EER_b = log2(2.0);
output;
group = "QCA";
CellWgt = 2;
meanlog2EER_a = log2(1.8);
meanlog2EER_b = log2(1.7);
output;
run;
proc print data=EER;
run;

/* --- 0093-proc-glmpower.sas --- */
proc GLMpower data=EER;
ODS output output=EER_Ntotals;
class group;
model meanlog2EER_a meanlog2EER_b = group;
weight CellWgt;
power
StdDev = 0.33 0.40
/* log2(2.5)/4 and log2(3.0)/4
*/
Ncovariates = 3
CorrXY = .2 .35 .50
alpha = .01 .05
power = 0.95 0.99
Ntotal = .;
run;

/* --- 0095-proc-glmpower.sas --- */
proc GLMpower data=EER;
ODS output output=EER_powers;
class group;
model meanlog2EER_a meanlog2EER_b = group;
weight CellWgt;
power
StdDev = 0.33 0.40
/* log2(2.5)/4 and log2(3.0)/4 */
Ncovariates = 3
CorrXY = .2 .35 .5
alpha = .01 .05
Ntotal = 300
power = .;
run;
* Augment GLMPOWER output to facilitate tabling ;
data EER_powers; set EER_powers;
if dependent = "meanlog2EER_a" then EEratio = "2.0 vs 1.8";
if dependent = "meanlog2EER_b" then EEratio = "2.0 vs 1.7";;
if UnadjStdDev = 0.33 then RelSpread95 = 2.5;
if UnadjStdDev = 0.40 then RelSpread95 = 3.0;
if power > .999 then power999 = .999;
else power999 = power;
run;
proc tabulate data=EER_powers format=4.3 order=data;
format Alpha 4.3 RelSpread95 3.1;
class EEratio alpha RelSpread95 CorrXY Ntotal;
var power999;
table
Ntotal="Total Sample Size: ",
EEratio="EE Ratios: "
* alpha="Alpha",
RelSpread95="95% Relative Spread"
* CorrXY="Partial R for Covariates"
* power999=""*mean=" "
/rtspace=35;
run;
