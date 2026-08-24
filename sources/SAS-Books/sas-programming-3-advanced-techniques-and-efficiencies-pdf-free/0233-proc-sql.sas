proc sql;
create table euros as
select Customer_ID, Order_Date, Product_ID,
Total_Retail_Price, SDate, EDate, AvgRate,
Total_Retail_Price*AvgRate as EuroPrice
format=Euro10.2
from orion.order_fact, orion.rates
where Order_Date between SDate and EDate;
title 'euros';
select * from euros;
quit;
