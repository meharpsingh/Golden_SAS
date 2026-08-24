ods layout gridded
  columns=2 column_widths=(240px 240px) column_gutter=20px;
ods region column=1;
ods graphics on / reset=all scale=off width=240px height=200px
  outputfmt=SVG
  imagemap=on; /* needed for data tips */
title justify=center 'Weight vs Height';
proc sgplot data=sashelp.class(where=(name =: 'J')) noborder
  description=' '; /* prevent mouseover pop-up of
