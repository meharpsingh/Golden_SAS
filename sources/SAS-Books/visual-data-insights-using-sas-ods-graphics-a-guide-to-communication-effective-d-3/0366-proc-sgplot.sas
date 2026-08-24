ods layout gridded rows=2 columns=2 column_widths=(210px
210px)
  column_gutter=20px;
/* setup for both graphs */
ods graphics on / reset=all scale=off width=210px
  outputfmt=SVG
  imagemap=on; /* needed for data tips */
ods region row=1 column=1;
title justify=center 'Weight vs Height';
proc sgplot data=sashelp.class(where=(name =: 'J')) noborder
  description=' ';
scatter x=height y=weight /
  tip=(name age height weight)
  tipformat=(auto auto F4.1 F3.)
  tiplabel=('Student' 'Age' 'Height (inches)' 'Weight
(pounds)')
  markerattrs=(symbol=CircleFilled color=green);
xaxis display=(noline noticks nolabel)
      values=(51 to 65 by 2) fitpolicy=none;
yaxis display=(noline noticks nolabel)
      values=(50 to 115 by 13) fitpolicy=none;
run;
ods region row=1 column=2;
title justify=center 'Average Height By Age';
proc sgplot data=sashelp.class(where=(name =: 'J')) noborder
  description=' ';
vbar age / response=height stat=mean datalabel
  displaybaseline=off
  barwidth=0.5 nooutline fillattrs=(color=green);
yaxis display=none;
xaxis display=(noline noticks nolabel);
format height 2.;
run;
