proc report data=sashelp.shoes nowd
     style(summary)=[foreground=green];
 title 'Sample E-mailed Output';
 footnote "Completed at %sysfunc(datetime(),datetime.)";
 columns product region, sales;
 define product / group ' ';
 define region / across ' ';
 define sales / sum ' ';
 rbreak after / summarize;
run;
