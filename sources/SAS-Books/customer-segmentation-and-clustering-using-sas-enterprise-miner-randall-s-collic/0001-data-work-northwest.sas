libname chapt1 'c:\chapter 1';  /* where C: is referring to your HD drive
on your computer. */
data work.northwest;
set chapt1.northwest;
if majmet=' ' then majmet=substr(zip,1,3);
run;
proc summary data=work.northwest nway sum;
class majmet state branch_code;
var sales ;
output out=work.nw_sum sum= ;
run;
title 'Northwest Customer Sales by State';
proc sql;
select state label='State',
sum(sales) as sum_sales label='Total Sales' format=dollar12.,
sum(_freq_) as count label='No of Customers'
from work.nw_sum as q1
group by state
;
quit; title;
title 'Northwest Customer Sales by Major Metro or 3digit Zip';
proc sql;
select majmet label='Major Metro/Zip Code',
sum(sales) as sum_sales label='Total Sales' format=dollar12.,
sum(_freq_) as count label='No of Customers'
from work.nw_sum as q1
group by majmet
order by count descending;
quit; title;
