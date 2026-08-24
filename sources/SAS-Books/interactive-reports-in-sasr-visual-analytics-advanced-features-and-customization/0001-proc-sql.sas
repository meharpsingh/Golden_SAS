libname ch2 '<path-for-data>';
proc sql;
create table ch2.AggregatedData as
select CustomerCountryLabel, count(distinct 'Customer ID'n) as
NumberOfCustomers label='Number of Customers'
 from ch2.Customers_Clean
 group by CustomerCountryLabel;
run;
