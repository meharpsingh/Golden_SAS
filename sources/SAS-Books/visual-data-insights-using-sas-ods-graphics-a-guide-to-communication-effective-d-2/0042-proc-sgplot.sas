ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=1.25in
  imagename="Fig4-11_OneCatTwoResp_OneBarSetOverlaysTheOtherBarSet";
title justify=center color=Blue  'Sales' color=Black ' and '
  color=Green 'Profit' color=Black ' by Product Line';
proc sgplot data=sashelp.orsales noborder noautolegend;
/* omit the Figure 4-10 offsets in the HBAR statements */
hbar Product_Line / response=Total_Retail_Price
  stat=sum displaybaseline=off
  nooutline fillattrs=(color=Blue) barwidth=0.3;
/* bars from the second HBAR statement overlay those from first */
hbar Product_Line / response=Profit
  stat=sum displaybaseline=off
  nooutline fillattrs=(color=Green)
barwidth=0.6
transparency=0.2; /* let the blue bar underneath
partially show through */
yaxistable Total_Retail_Price / location=inside position=left
  nolabel valueattrs=(color=Blue);
yaxistable Profit / location=inside position=left
  nolabel valueattrs=(color=Green);
yaxis display=(nolabel noline noticks) fitpolicy=none;
xaxis display=none;
format Total_Retail_Price dollar12. Profit dollar11.;
run;
