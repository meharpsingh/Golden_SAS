/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0063-data-cars.sas --- */
data cars;
set sashelp.cars;
run;
proc sql;
select count(type),type,origin
from cars
group by type ,origin;
run;

/* --- 0064-proc-sql.sas --- */
proc sql;
select avg(mpg_city),origin
from cars
group by origin;
run;
