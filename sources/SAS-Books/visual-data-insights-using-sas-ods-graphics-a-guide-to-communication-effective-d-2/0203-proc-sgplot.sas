%include "C:\SharedCode\IBM1998CloseAndMaxCloseMacroVariable.sas";
ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=3.6in
  imagename=
  "Fig8-17_BandHighLow_ScatterPlotClose_AxisTablesHighOpenLow";
title1 justify=center 'High, Low, '
color=red 'Open'
color=black ', and '
color=blue 'Close'
color=black ' Price for IBM Shares';
title2 justify=center 'On First Trading Day of Each Month in 1998';
proc sgplot
data=work.IBM1998Close
 noautolegend noborder;
band x=Date upper=High lower=Low / type=series
fill fillattrs=(color=CXEEEEEE);
scatter
 x=Date y=Close /
datalabel datalabelattrs=(color=blue)
  markerattrs=(color=blue symbol=CircleFilled size=6);
xaxistable High / label='High' location=inside title='';
xaxistable Open / label='Open' location=inside title=''
labelattrs=(color=red) valueattrs=(color=red);
xaxistable Low  / label='Low'  location=inside title='';
yaxis display=(noline noticks nolabel)
  values=(0
&MaxClose
) valuesdisplay=("0" " ");
xaxis display=(noline noticks nolabel) type=discrete;
format Date monname3. High Low Open Close 3.;
run;
