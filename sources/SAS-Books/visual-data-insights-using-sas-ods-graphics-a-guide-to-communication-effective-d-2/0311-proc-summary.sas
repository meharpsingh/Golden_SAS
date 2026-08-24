proc summary data=work.Extract nway;
class Height;
var Height;
output out=work.ToPlot(keep=Height _freq_) N=Unused;
run;
