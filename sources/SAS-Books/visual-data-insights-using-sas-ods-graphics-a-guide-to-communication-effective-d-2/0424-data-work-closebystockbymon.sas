data work.CloseByStockByMon;
  format Date 5.;
  format Close 3.;
  set SASHELP.STOCKS
    (keep=Stock Date Close);
  if 1998 LE year(Date) LE 2001;
  Close=round(Close); /* eliminate pennies */
run;
proc sort data=work.CloseByStockByMon;
by Stock Date; /* in case input
