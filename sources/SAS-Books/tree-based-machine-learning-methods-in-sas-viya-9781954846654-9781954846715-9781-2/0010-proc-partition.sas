proc partition data=public.PaySimScore samppct=7 seed=8844 partind
nthreads=3;
  by isFraud;
  output out=public.SampledScore copyvars=(_ALL_);
run;
proc template;
    define statgraph anomalyPlot;
        begingraph;
              layout overlay;
              scatterplot y=amount x=newbalanceDest /
                  name='color'
                  markerattrs=(symbol=circlefilled)
                  colormodel=(cyan ligr red)
                  colorresponse=_Anomaly_;
                  continuouslegend 'color'/ title='_Anomaly_';
              endlayout;
        endgraph;
  end;
run;
ods graphics on;
proc sgrender data=public.SampledScore (where=(_PartInd_=1))
template=anomalyPlot;
run;
proc sgplot data=public.SampledScore (where=(_PartInd_=1));
       histogram _Anomaly_ / group=isFraud;
       yaxis grid;
run;
