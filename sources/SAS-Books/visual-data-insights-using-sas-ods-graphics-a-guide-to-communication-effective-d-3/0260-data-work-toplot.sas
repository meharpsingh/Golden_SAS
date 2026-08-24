data work.ToPlot;
length YandX $ 8 Gender $ 6;;
set sashelp.class;
YandX = compress(put(weight,3.) || ',' || put(height,2.));
if Sex EQ 'F'
then Gender = 'Female';
else Gender = 'Male';
output;
Gender='Either';
output;
run;
ods listing style=GraphFontArial11ptBold gpath="C:\temp"
dpi=300;
ods graphics on / reset=all scale=off width=5.7in
height=5.7in
  imagename="Fig9-
32_OneRowPanel_ScatterPlots_DataLabelsForYandX";
title1 justify=center
  "Weight (pounds) versus Height (inches) By Sex";
proc sgpanel data=work.ToPlot noautolegend;
styleattrs datacontrastcolors=(red blue);
