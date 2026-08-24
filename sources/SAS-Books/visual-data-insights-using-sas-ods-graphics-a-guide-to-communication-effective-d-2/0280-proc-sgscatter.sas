ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename=
  "Fig10-8_3VarsGroupVar_MatrixOfScatterPlots_WithDiagonalContent";
title1 justify=center
  'Vehicle Weight, Length, and MPG (City) By Place of Origin';
title2 justify=center
  'Matrix of Scatter Plots, Histograms, & Normal Distributions';
proc sgscatter data=sashelp.cars
datacontrastcolors=(gray turquoise magenta);
