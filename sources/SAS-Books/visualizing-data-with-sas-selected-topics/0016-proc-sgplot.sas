ods listing style=journal;
title "Impact of Treatment on Mortality by Study";
title2 h=8pt 'Odds Ratio and 95% CL';
proc sgplot data=forest noautolegend nocycleattrs nowall noborder;
  styleattrs axisextent=data;
  scatter y=study x=or2 / markerattrs=graphdata2(symbol=diamondfilled);
  highlow y=study low=lcl high=ucl / type=line;
  highlow y=study low=q1 high=q3 / type=bar barwidth=0.6;
  yaxistable study / y=study location=inside position=left
          labelattrs=(size=7);
  yaxistable or lcl ucl wt / y=study location=inside position=right
          labelattrs=(size=7);
  refline 1  / axis=x noclip;
  refline 0.01 0.1 10 100 / axis=x lineattrs=(pattern=shortdash)noclip;
  text y=study x=xlbl text=lbl  / position=center contributeoffsets=none;
  xaxis type=log  max=100 minor display=(nolabel)  valueattrs=(size=7);
  yaxis display=none fitpolicy=none reverse valueshalign=left
        colorbands=even valueattrs=(size=7)
        colorbandsattrs=Graphdatadefault(transparency=0.8);
run;
