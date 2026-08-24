proc freq data=sashelp.failure;
  table cause*day / nocol nopercent;
  weight count;
  where cause eq 'Corrosion' and cause eq 'Contamination';
run;
