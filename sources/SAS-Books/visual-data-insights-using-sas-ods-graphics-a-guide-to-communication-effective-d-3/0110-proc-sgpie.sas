proc sgpie data=work.Rank_Product_Sales_Percent;
styleattrs datacolors=(
BLACK PURPLE CX3333FF CX00FFFF CX00FF00 ORANGE CXFFCC66
CXFFFF00 );
pie Rank_Product_Sales_Percent / otherpercent=0
  response=Sales
  sliceorder=respdesc direction=clockwise
  startangle=90 startpos=edge
  datalabeldisplay=none;
keylegend / noborder title=''
  across=1 position=right
  valueattrs=(size=9pt)
  fillaspect=golden fillheight=9pt;
run;
