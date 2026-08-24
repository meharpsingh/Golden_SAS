/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0167-proc-sort.sas --- */
  proc sort data=Learn.Sales out=Sales;
by EmpID descending TotalSales;
  run;
  title "Sorting by More than One Variable";
  proc print data=sales;
id EmpID;
var TotalSales Quantity;
format TotalSales dollar10.2 Quantity comma7.;
  run;

/* --- 0168-proc-print.sas --- */
  proc print data=Sales label;
id EmpID;
var TotalSales Quantity;
label EmpID = "Employee ID"
TotalSales = "Total Sales"
Quantity = "Number Sold";
format TotalSales dollar10.2 Quantity comma7.;
  run;
