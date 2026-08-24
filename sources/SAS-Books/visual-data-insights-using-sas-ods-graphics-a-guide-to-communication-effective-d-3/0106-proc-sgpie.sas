proc sgpie data=sashelp.shoes;
styleattrs datacolors=(
BLACK PURPLE CX3333FF CX00FFFF CX00FF00 ORANGE CXFFCC66
CXFFFF00);
pie Product / response=Sales otherpercent=0
  sliceorder=respdesc direction=clockwise
  startangle=90 startpos=edge
  datalabeldisplay=all
  datalabelattrs=(size=8pt)
  datalabelloc=callout;
run;
