ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=3in
imagename="Fig8-22_SeriesClose_SeriesVolume_XaxisTables_TwoYaxes
";
title1 justify=center
  'Close Price & Volume (in millions) for IBM Shares';
title2 justify=center 'On First Trading Day Each Month in 1998';
proc sgplot noautolegend noborder
  data=
work.IBM1998WithVolumeInMillions; /* Listing 8-21 created
run;
