ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=
300
;
ods graphics / reset=all noscale width=
5.7
in height=
3.5
in
  maxlegendarea=
50
  imagename=
  'Fig5-14_RankedSales_TwoAcrossBottomFullInfoLegend_CustomColors';
title1 'Ranked Shoe Sales and Percent Share By Product';
title2 color=white 'INVISIBLE Text to create white space';
proc sgpie
data=work.Rank_Product_Sales_Percent;
styleattrs datacolors=(
BLACK PURPLE CX3333FF CX00FFFF CX00FF00 ORANGE CXFFCC66 CXFFFF00 )
;
