proc partition data=mycas.SmalltrainData samppct=80
     samppct2=20 seed=12345 partind;
     by _label_;
   output out=mycas.smallImageData;
run;
proc partition data=mycas.LargetrainData samppct=80
        samppct2=20 seed=12345 partind;
     by _label_;
     output out=mycas.LargeImageData;
run;
