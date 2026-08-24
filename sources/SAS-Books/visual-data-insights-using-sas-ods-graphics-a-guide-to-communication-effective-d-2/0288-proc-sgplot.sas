ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=5.7in
  imagename=
  "Fig10-13Right_TimeSeriesOverlayPlotFor3GroupValuesOver144Months";
title1 justify=center
color=magenta 'Rescaled '
 color=black
  'Industrial Production, Unemployment Rate, & Avg Weekly Unemployment Insurance Claims By Month 1980 to 1991';
proc sgplot data=work.ToPlot
 noborder;
where 1980 LE YEAR(Date) LE 1991;
styleattrs datacontrastcolors=(blue red purple);
scatter y=CitiValue x=Date / Group=CitiVar
markerattrs=(symbol=CircleFilled);
yaxis display=(nolabel noline noticks)
  grid minorgrid minorcount=9
  values=(3 to 11 by 1)
offsetmin=0.05 offsetmax=0.05
;
xaxis display=(nolabel noline noticks) grid
  valueattrs=(size=10pt);
keylegend / title='' noborder autoitemsize;
format CitiVar $CitiVarName.;
run;
