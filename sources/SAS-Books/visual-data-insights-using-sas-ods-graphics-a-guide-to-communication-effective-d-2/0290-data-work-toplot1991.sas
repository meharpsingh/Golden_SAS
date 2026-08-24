data work.ToPlot1991;
set work.ToPlot;
where YEAR(Date) EQ 1991;
Month=put(Date,monname3.);
run;
