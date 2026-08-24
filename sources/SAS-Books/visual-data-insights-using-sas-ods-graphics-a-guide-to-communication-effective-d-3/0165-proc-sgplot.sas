proc sgplot data=work.IBM1998Close noborder;
series x=Date y=Close / datalabel lineattrs=
(pattern=ThinDot)
  markers markerattrs=(symbol=CircleFilled color=blue
size=6);
yaxis display=(noline noticks nolabel) values=(0
&MaxClose)
  valuesdisplay=("0" " "); /* Identify the Y=0 point of
