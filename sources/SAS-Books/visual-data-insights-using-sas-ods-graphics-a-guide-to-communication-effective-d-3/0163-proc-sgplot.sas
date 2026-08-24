proc sgplot data=work.IBM1998Close noborder;
series x=Date y=Close /
  markers markerattrs=(symbol=CircleFilled color=blue
size=6)
  lineattrs=(pattern=Solid color=green thickness=3);
dropline x=Date y=Close / dropto=x;
