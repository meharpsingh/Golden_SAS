data dataInput;
length YearAndQtr $ 6 PlurOrMinusDollars 3;
YearAndQtr = '2020Q1';
PlurOrMinusDollars = 10;
output;
YearAndQtr = '2020Q2';
PlurOrMinusDollars = -5;
output;
YearAndQtr = '2020Q3';
PlurOrMinusDollars = 20;
output;
YearAndQtr = '2020Q4';
PlurOrMinusDollars = -15;
output;
run;
data ToChart;
length MinusOneOrPlusOne 3;
set dataInput;
if PlurOrMinusDollars LT 0
then MinusOneOrPlusOne = '-1';
else MinusOneOrPlusOne = '+1';
run;
ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=3in
  imagename="Fig4-40_WaterfallChart";
title "2020 Financial Performance";
