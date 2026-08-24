proc sgplot data=SASHelp.Iris;
   loess x=PetalWidth y=PetalLength;
run;
