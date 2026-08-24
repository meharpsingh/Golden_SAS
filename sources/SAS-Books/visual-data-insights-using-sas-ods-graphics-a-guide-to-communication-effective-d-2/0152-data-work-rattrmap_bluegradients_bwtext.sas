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
_min_ 1000000 .
Black
 White LightBlue
1000000 _max_ .
White
 Blue  DarkBlue
;
run;
