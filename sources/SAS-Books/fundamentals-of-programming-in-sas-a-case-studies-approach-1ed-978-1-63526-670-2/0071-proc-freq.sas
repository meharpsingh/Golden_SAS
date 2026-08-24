proc freq data=sashelp.failure;
  table day*cause / nocol nopercent;
  weight count;
  where cause eq 'Corrosion' or cause eq 'Contamination';
run;
