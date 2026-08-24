/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0043-data-trucksales.sas --- */
data trucksales;
call streaminit(768234);
rural_intercept = 10;
urban_intercept = 8;
suburban_intercept = 9;
do i = 1 to 100;
population = rand('POISSON', 50000);
prop_bachelors = rand('BETA', 10, 30);
pop_bachelors = INT(prop_bachelors * population);
pop_below_bachelors = INT((1 - prop_bachelors) * population);
median_income = INT(exp(log(40000) + .3*rand('NORMAL', 0, 1)));
price = ROUND(25000 + 1000 * rand('NORMAL', 0, 1), 100);
cost_of_living = INT(130 + 20*rand('NORMAL', 0, 1));
mean_summer_temp = INT(85 + 5*rand('NORMAL', 0, 1));
mean_winter_temp = INT(35 + 8*rand('NORMAL', 0, 1));
mean_precip = INT(exp(log(22) + .4*rand('NORMAL', 0, 1)));
rural_idx = rand('NORMAL', 0, 1);
if rural_idx < -0.7 then area_type = 'rural';
if rural_idx >
0.7 then area_type = 'urban';
if abs(rural_idx) <= 0.7 then area_type = 'sub';
if area_type = 'rural' then intercept = rural_intercept;
if area_type = 'urban' then intercept = urban_intercept;
if area_type = 'sub'
then intercept = suburban_intercept;
xbeta = intercept - 1 + 0.03 * log(pop_bachelors) +
0.04 * log(pop_below_bachelors) + 0.04 * log(median_income) +
- 0.5 * log(price) - 0.02 * log(cost_of_living) +
- 0.02 * log(mean_summer_temp) + 0.3 * log(mean_winter_temp) +
0.02 * log(mean_precip);
sales = CEIL(exp(xbeta + 0.05 * rand('NORMAL', 0, 1)));
output;
end;
keep pop_bachelors pop_below_bachelors median_income price cost_of_living
mean_summer_temp mean_winter_temp mean_precip area_type sales;
run; quit;

/* --- 0044-proc-summary.sas --- */
proc summary data = trucksales print maxdec=2;
var pop_bachelors pop_below_bachelors median_income cost_of_living
mean_summer_temp mean_winter_temp mean_precip price sales;
run; quit;
proc summary data = trucksales print;
class area_type;
run; quit;

/* --- 0045-data-trucksales_log.sas --- */
data trucksales_log;
set trucksales;
log_pop_bachelors = log(pop_bachelors);
log_pop_below_bachelors = log(pop_below_bachelors);
log_median_income = log(median_income);
log_price = log(price);
log_cost_of_living = log(cost_of_living);
log_mean_precip = log(mean_precip);
log_sales = log(sales);
mean_summer_temp_cs = mean_summer_temp;
mean_winter_temp_cs = mean_winter_temp;
keep mean_summer_temp_cs mean_winter_temp_cs area_type
log_pop_bachelors log_pop_below_bachelors log_median_income log_price
log_cost_of_living log_mean_precip log_sales;
run; quit;
proc standard data = trucksales_log mean=0 std=1 out=trucksales_transformed;
var mean_summer_temp_cs mean_winter_temp_cs;
run; quit;

/* --- 0054-data-trucksales_count.sas --- */
data trucksales_count;
set trucksales;
log_pop_bachelors = log(pop_bachelors);
log_pop_below_bachelors = log(pop_below_bachelors);
log_median_income = log(median_income);
log_price = log(price);
log_cost_of_living = log(cost_of_living);
log_mean_precip = log(mean_precip);
mean_summer_temp_cs = mean_summer_temp;
mean_winter_temp_cs = mean_winter_temp;
keep mean_summer_temp_cs mean_winter_temp_cs area_type
log_pop_bachelors log_pop_below_bachelors log_median_income log_price
log_cost_of_living log_mean_precip sales;
run; quit;
proc standard data = trucksales_count mean=0 std=1 out=truckcount_transformed;
var mean_summer_temp_cs mean_winter_temp_cs;
run; quit;
proc countreg data = truckcount_transformed plots = none;
class area_type;
model sales = area_type log_pop_bachelors log_pop_below_bachelors
log_median_income log_price log_cost_of_living
log_mean_precip mean_summer_temp_cs mean_winter_temp_cs;
bayes seed = 56549 ntu = 100 mintune = 20 maxtune = 20 nmc = 10000
statistics = (summary interval prior);
prior intercept ~ normal(mean = 8.88, var = 10000);
prior log_pop_bachelors log_pop_below_bachelors log_median_income
log_cost_of_living log_mean_precip log_price ~ normal(mean = 0, var = 16);
prior mean_summer_temp_cs mean_winter_temp_cs
area_type_rural area_type_sub ~ normal(mean = 0, var = 7.62);
prior log_price ~ normal(mean = -0.96, var = 0.25);
run; quit;
