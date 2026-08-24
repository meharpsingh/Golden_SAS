data work.ToPlot;
set sashelp.cars(keep=Type Cylinders Drivetrain Origin MSRP);
MSRP = MSRP / 1000;
run;
ods listing style=GraphFontArial7ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=7.6in
  imagename=
  "Fig9-33_PanelWithThreeClassVariablesForHbarsWithDataLabels";
title1 justify=center 'Average Vehicle Price ($K) By Origin, Type, Cylinders, and Drive Train';
