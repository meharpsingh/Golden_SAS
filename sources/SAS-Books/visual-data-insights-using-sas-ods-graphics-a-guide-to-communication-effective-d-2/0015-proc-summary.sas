proc summary data=ToSummary nway;
class IntegerHeight;
var weight;
output out=ToPlot mean=MeanWgt;
run;
