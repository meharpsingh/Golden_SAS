proc summary data=sashelp.shoes nway;
class Product;
var Sales;
output out=work.Summed(drop=_freq_ _type_) sum=;
run;
proc sort data=work.Summed out=work.Sorted;
by descending Sales;
run;
data work.ToPlot;
set work.Sorted;
Sales = Sales / 1000000;
run;
ods listing style=GraphFontArial9ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=2.5in
  imagename="Fig4-41_RankedNeedlePlot";
title justify=center 'Ranked Shoe Sales ($M) By Product';
