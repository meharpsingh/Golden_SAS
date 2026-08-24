data work.IBM1998WithVolumeInMillions;
retain MinClose MinVolume 999999999999 MaxClose MaxVolume
0;
set sashelp.Stocks end=LastOne;
where year(Date) EQ 1998 and Stock EQ 'IBM';
Volume = Volume / 1000000;
output;
MinVolume = min(MinVolume,Volume);
MaxVolume = max(MaxVolume,Volume);
MinClose = min(MinClose,Close);
MaxClose = max(MaxClose,Close);
if LastOne;
call
symput('MaxCloseDisplay',trim(left(put(MaxClose,6.2))));
call symput('MaxClose',MaxClose);
call
symput('MaxVolumeDisplay',trim(left(put(MaxVolume,6.2))));
call symput('MaxVolume',MaxVolume);
call
symput('MinCloseDisplay',trim(left(put(MinClose,6.2))));
call symput('MinClose',MinClose);
call
symput('MinVolumeDisplay',trim(left(put(MinVolume,6.2))));
call symput('MinVolume',MinVolume);
run;
ods listing style=GraphFontArial11ptBold gpath="C:\temp"
dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename="Fig8-
21_SeriesClose_SeriesVolume_DataLabels_TwoYaxes";
title1 justify=center  color=green 'Close Price'
color=black ' & '
  color=blue 'Volume (in millions)' color=black ' for IBM
Shares';
title2 justify=center 'On First Trading Day Each Month in
1998';
proc sgplot data=work.IBM1998WithVolumeInMillions
  noautolegend noborder;
series x=Date y=Close /
  datalabel datalabelattrs=(color=green)
  markers markerattrs=(symbol=CircleFilled color=green
size=6)
  lineattrs=(pattern=Solid color=green thickness=3);
series x=Date y=Volume / y2axis
  datalabel datalabelattrs=(color=blue)
  markers markerattrs=(symbol=CircleFilled color=blue
size=6)
  lineattrs=(pattern=Solid color=blue thickness=3);
yaxis display=(noline noticks nolabel) valueattrs=
(color=green)
  values = (&MinClose &MaxClose)
  valuesdisplay = ("&MinCloseDisplay" "&MaxCloseDisplay");
