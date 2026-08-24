data work.ToChart(keep=Age GirlWgt BoyWgt);
set sashelp.class;
if Sex EQ 'F' then GirlWgt = 0 - Weight;
else BoyWgt  = Weight;
run;
