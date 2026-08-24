data work.Extract(keep=Height);
set sashelp.heart(where=(Sex EQ 'Female' AND Height NE .));
run;
proc summary data=work.Extract nway;
class Height; var Height;
output out=work.ToPlot(keep=Height _freq_) N=Unused;
run;
