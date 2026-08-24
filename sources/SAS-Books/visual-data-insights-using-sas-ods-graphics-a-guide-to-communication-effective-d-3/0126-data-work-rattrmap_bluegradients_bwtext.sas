data work.RattrMap_BlueGradients_BWtext;
retain id "RangeID";
length min   max $ 7 color   altcolor
  colormodel1   colormodel2 $ 18;
input  min $ max $   color $ altcolor $
  colormodel1 $ colormodel2 $;
/* altcolor controls the text color */
/* colormodel1 and colormodel2 specify
   start and end of color gradient ranges
   (here, the two subranges) */
datalines;
_min_ 1000000 . Black White LightBlue
1000000 _max_ . White Blue  DarkBlue
;
run;
proc summary data=sashelp.shoes nway;
class region product;
var sales;
output out=work.ToHeatMap sum=;
run;
ods listing gpath="C:\temp" dpi=300
style=GraphFontArial7ptBold;
ods graphics / reset=all scale=off width=5.7in
  imagename=" Fig6-
6_AnnoHeatMapBlueGrads_AnnoVsCellColorContrast";
title1 height=11pt justify=center
  'Shoe Sales by Region and Product';
proc sgplot data=work.ToHeatMap
  rattrmap=work.RattrMap_BlueGradients_BWtext;
