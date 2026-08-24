proc freq data=sashelp.failure;
  table cause*day / norow nopercent;
  weight count;
