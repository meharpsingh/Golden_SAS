/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0049-data-truck_ad.sas --- */
data truck_ad;
call streaminit(92342);
do i = 1 to 10000;
race_idx = rand('NORMAL', 0, 1);
if race_idx >= 0 then
do;
race = 'white';
age = rand('POISSON', 55);
intercept = 1.1;
end;
if race_idx < 0 then
do;
race = 'black';
age = rand('POISSON', 50);
intercept = 0.7;
end;
if race_idx < -1 then
do;
race = 'asian';
age = rand('POISSON', 60);
intercept = -2.9;
end;
if race_idx < -2 then
do;
race = 'other';
age = rand('POISSON', 55);
intercept = -1.8;
end;
price_idx = rand('uniform', 0, 4);
price = 20;
if price_idx > 1 then price = 21;
if price_idx > 2 then price = 22;
if price_idx > 3 then price = 23;
prev_purchase = rand('BINOMIAL', 0.3, 1);
sex = rand('BINOMIAL', 0.7, 1);
drive_time = INT(exp(log(60) + 0.5*rand('NORMAL', 0, 1)));
mu = 7.5 + intercept + 0.1 * sex + 0.001 * age +
0.002 * prev_purchase - 0.002 * drive_time - 0.5 * price;
prob = 1 / (1 + exp(-mu));
purchase = rand('BINOMIAL', prob, 1);
output;
end;
keep race sex age price prev_purchase drive_time purchase;
run; quit;

/* --- 0050-proc-summary.sas --- */
proc summary data = truck_ad print maxdec=2;
var age sex price drive_time prev_purchase purchase;
run; quit;
proc summary data = truck_ad print;
class race;
run; quit;

/* --- 0051-data-truck_ad_cs.sas --- */
data truck_ad_cs;
set truck_ad;
age_cs = age;
drive_time_cs = drive_time;
log_price = log(price);
keep race sex age_cs drive_time_cs prev_purchase log_price purchase;
run; quit;
proc standard data = truck_ad_cs mean=0 std=1 out=truck_ad_transformed;
var age_cs drive_time_cs;
run; quit;
proc summary data = truck_ad_transformed print maxdec=2;
var age_cs sex log_price drive_time_cs prev_purchase purchase;
run; quit;
