proc sgplot data=LFT;
  refline 1 / lineattrs=(pattern=shortdash);
  dropline x='BILTOT' y=2.0 / dropto=y discreteoffset=-0.5;
  dropline x='BILTOT' y=1.5 / y2axis dropto=y discreteoffset=-0.5;
  vbox a / category=test discreteoffset=-0.15 boxwidth=0.2 name='a'
           legendlabel='Drug A (N=209)';
  vbox b / category=test discreteoffset= 0.15 boxwidth=0.2 name='b'
           legendlabel='Drug B (N=405)';
  vbox a / category=test y2axis transparency=1;
  vbox b / category=test y2axis transparency=1;
  keylegend 'a' 'b';
  xaxis display=(nolabel);
  y2axis display=none;
run;
