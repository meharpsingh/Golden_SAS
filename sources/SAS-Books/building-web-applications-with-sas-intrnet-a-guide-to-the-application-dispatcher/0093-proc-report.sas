proc report data=sashelp.shoes nowd
     style(summary)=[foreground=green];
 columns product region, sales;
 define product / group ' ';
 define region / across ' ';
 define sales / sum ' ';
 rbreak after / summarize;
run;
