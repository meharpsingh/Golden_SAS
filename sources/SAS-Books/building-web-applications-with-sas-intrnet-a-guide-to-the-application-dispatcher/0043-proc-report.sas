%let where=product in ("Boot" "Men's Dress" "Men's Casual"); X
proc report data=sashelp.shoes nowd
     style(summary)=[foreground=green];
 where &where;
 columns product region, sales;
 define product / group ' ';
 define region / across ' ';
run;
