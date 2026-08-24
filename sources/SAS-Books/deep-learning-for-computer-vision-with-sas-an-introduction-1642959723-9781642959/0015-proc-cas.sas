proc cas;
              initWeights='ConVbestweights'
              layerOut={name='Layer_data', replace=1}
              layers='ConVLayer1'
              layerImageType='JPG'
              casout={name='ScoredData', replace=1}
  dlScore / table={name='LargeImageDatashuffled',
                   where='_PartInd_=2'} model='ConVNet'
              copyVars='_Label_'
;
run;
proc print data=mycas.ScoredData (obs=20);
run;
