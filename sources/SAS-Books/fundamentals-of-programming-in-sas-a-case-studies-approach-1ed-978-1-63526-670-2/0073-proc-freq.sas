proc freq data=sashelp.failure;
  table cause*day / nocol nopercent;
  weight count;
  where cause eq 'Corrosion' or cause eq 'Contamination';
run;
