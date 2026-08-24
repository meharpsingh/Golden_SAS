proc sort data=sashelp.orsales(keep=Year)
  out=work.ForAttrMap nodupkey;
by Year;
run;
data work.YearDattrMap;
keep ID Value FillColor;
set work.ForAttrMap end=LastOne;
length ID $ 8 Value $ 4 FillColor $ 8;
retain ID 'Years';
if LastOne
then FillColor='Green';
else FillColor='CX6666FF';
Value = Year;
run;
ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=2.5in
  imagename="Fig4-
39_TemporalVbarChart_LastIntervalColorHighlight";
title "ORSALES Annual Profit - 1999 to 2002";
proc sgplot data=sashelp.orsales noborder noautolegend
  dattrmap=work.YearDattrMap;
vbar Year / response=Profit
  group=Year
  attrid=Years
  displaybaseline=off nooutline
  datalabel;
xaxis display=(nolabel noline noticks); yaxis display=none;
format Profit dollar13.2;
run;
