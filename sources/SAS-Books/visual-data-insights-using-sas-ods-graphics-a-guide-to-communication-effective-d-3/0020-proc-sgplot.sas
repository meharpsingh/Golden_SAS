proc sgplot data=work.ToPlot noborder;
styleattrs datacontrastcolors=(red blue);
scatter y=weight x=height /
  group=sex
  datalabel=DataLabelText
  datalabelattrs=(size=9pt)
  markerattrs=(symbol=CircleFilled);
yaxis grid
  display=(noline noticks nolabel)
  values=(50 to 150 by 10);
xaxis grid
  display=(noline noticks nolabel)
  values=(51 to 72 by 1);
keylegend / noborder;
run;
