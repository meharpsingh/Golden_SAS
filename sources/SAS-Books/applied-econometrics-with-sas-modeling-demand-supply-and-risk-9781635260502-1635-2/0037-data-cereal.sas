data cereal;
set cereal;
   ave_price_other = (sum_price - price) / (count - 1);
   ave_cals_other = (sum_cals - cals) / (count - 1);
   ave_fat_other = (sum_fat - fat) / (count - 1);
   ave_sugar_other = (sum_sugar - sugar) / (count - 1);
run;
/*Using average characteristics of all other products as IVs to run 2SLS*/
proc syslin data = cereal 2sls ;
endogenous price ;
