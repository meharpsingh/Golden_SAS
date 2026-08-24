%let save_where = product in ("Boot" "Men's Dress" "Men's Casual"); o
%let save_data = save.subset;
%let save_subgroup = product;
data &save_data; p
 set sashelp.shoes;
 where &save_where;
run;
proc report data=&save_data nowd
     style(summary)=[foreground=green];
 columns product region, sales;
 define product / group ' ';
