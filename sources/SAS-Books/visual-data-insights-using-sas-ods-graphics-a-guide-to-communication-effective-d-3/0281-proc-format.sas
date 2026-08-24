proc format;
value $CitiVarName
  'IP' = 'Industrial Production / 10'
  'LHUR' = 'Unemployment Rate (%)'
  'LUINC' = 'Avg Weekly Unemployment Insurance Claims /
100';
quit;
ods listing style=GraphFontArial11ptBold gpath="C:\temp"
dpi=300;
ods graphics on / reset=all scale=off width=5.7in
height=5.7in
  imagename=
  "Fig10-
13Right_TimeSeriesOverlayPlotFor3GroupValuesOver144Months";
