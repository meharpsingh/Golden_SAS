Proc SQL;
  Title 'Sales Report for Management';
  Create View Sales_MI As
Select Date, Day, Car, SUM(Units) As Units_Sold, SUM(Units*Avg_Price) As Revenue
  From Dealership
  Group by 1,2,3;
Quit;
