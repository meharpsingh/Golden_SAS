ods graphics on;
proc freq data=Sashelp.Class;
tables age / plot=FreqPlot;
ods select FreqPlot;
run;
