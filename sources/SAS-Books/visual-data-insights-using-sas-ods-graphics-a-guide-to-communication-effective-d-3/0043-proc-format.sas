proc format;
picture AbsoluteValue_ThreeDigits
  low-<0  = '000'
  0<-high = '000';
run;
data work.ToChart(keep=Age GirlWgt BoyWgt);
set sashelp.class;
if Sex EQ 'F' then GirlWgt = 0 - Weight;
else BoyWgt  = Weight;
run;
ods listing style=GraphFontArial10ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=2in
  imagename="Fig4-18_OneCatTwoSimilarRespVars_ButterFlyHbarChart";
title1 justify=center "Average Weight (pounds) of Students By
Age";
