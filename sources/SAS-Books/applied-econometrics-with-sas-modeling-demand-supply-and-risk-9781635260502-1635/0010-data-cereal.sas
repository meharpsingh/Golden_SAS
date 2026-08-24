data cereal;
set cereal;
   ave_price_company = (sum_price_company -price) / (count_company - 1);
   ave_cals_company = (sum_cals_company -cals) / (count_company - 1);
   ave_fat_company = (sum_fat_company - fat) / (count_company - 1);
   ave_sugar_company = (sum_sugar_company - sugar) / (count_company - 1);
run;
proc print data = cereal;
run;
/*2SLS using average characteristics of other products produced by same company*/
proc syslin data = cereal 2sls ;
   endogenous price ;
