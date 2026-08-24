%include "C:\SharedCode\IBM1998CloseAndMaxCloseMacroVariable.sas";
ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=3in
  imagename="Fig8-3_SeriesClose_DataLabelsForYvalues";
title1 justify=center
'Close Price for IBM Shares on First Trading Day Each Month - 1998';
title2 color=white 'White Space';
proc sgplot
data=work.IBM1998Close
 noborder;
series x=Date y=Close /
datalabel
 lineattrs=(pattern=ThinDot)
  markers markerattrs=(symbol=CircleFilled color=blue size=6);
yaxis display=(noline noticks nolabel)
values=(0 &MaxClose)
valuesdisplay=("0" " "); /* Identify the Y=0 point of the axis.
run;
