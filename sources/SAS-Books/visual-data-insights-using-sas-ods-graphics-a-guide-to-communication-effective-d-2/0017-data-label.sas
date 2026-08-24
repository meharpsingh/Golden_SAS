data label
ods graphics on / reset=all scale=off width=5.7in
  imagename=
  "Fig3-10_Scatter_Plot_Added_DataLabel_Mentioned_in_the_Title";
title font='Arial/Bold' height=11pt justify=center
   color=red "Average Weight (pounds) "
   color=black "VS "
   color=blue "Integer Height (inches) "
   color=black "- "
   color=purple "Student Count";
scatter y=MeanWgt x=IntegerHeight /
  markerattrs=(symbol=circlefilled size=9pt color=red)
datalabel=_freq_
datalabelattrs=(family=Arial size=9pt weight=Bold color=purple)
;
