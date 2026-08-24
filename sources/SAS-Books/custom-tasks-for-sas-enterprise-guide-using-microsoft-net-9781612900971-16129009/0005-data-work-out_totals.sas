data WORK.OUT_TOTALS;
  set SASHELP.CARS(
    where=(Origin IN ('Europe','USA') AND Cylinders >= 6)
   );
  totals_MSRP + MSRP;
run;
