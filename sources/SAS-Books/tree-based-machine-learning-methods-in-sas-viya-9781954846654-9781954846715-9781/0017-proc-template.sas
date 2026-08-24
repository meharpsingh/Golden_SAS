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
