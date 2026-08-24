proc sgplot data=work.FREQout_MPGasCharData_Sorted
  noautolegend rattrmap=work.RattrMap_DarkBlueRed;
heatmap y=type x=MPG_City_Characters / outline
  rattrid=RangeID
  colorresponse=count;
