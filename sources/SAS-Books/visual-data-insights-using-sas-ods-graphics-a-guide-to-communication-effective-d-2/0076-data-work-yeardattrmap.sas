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
