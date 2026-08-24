proc sgplot data=plotZoneCount noautolegend dattrmap=attrmap;
  scatter x=x y=y / group=zone attrid=A filledoutlinedmarkers
          markerattrs=(symbol=circlefilled size=5);
  series x=rfbg y=sbg / group=id nomissinggroup
         lineattrs=graphdatadefault(color=black) ;
  text x=xl y=yl text=label / backfill fillattrs=(color=white) outline;
  xaxis min=0 max=400 offsetmin=0 offsetmax=0
        label='Reference Blood Glucose';
  yaxis min=0 max=400 offsetmin=0 offsetmax=0
        label='Sensor Blood Glucose';
run;
