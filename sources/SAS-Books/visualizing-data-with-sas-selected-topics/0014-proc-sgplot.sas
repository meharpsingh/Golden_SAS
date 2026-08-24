proc sgplot data=SurvivalPlotData;
  step x=time y=survival / group=stratum lineattrs=(pattern=solid)
       name='s' curvelabel curvelabelattrs=(size=6) splitchar='-';
  scatter x=time y=censored / name='c'
       markerattrs=(symbol=circlefilled size=4);
