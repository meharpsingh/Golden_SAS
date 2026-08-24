data work.Extract(keep=Height);
set sashelp.heart(where=(Sex EQ 'Female' AND Height NE .));
run;
