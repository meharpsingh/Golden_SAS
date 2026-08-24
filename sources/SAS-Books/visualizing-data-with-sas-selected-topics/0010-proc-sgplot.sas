proc sgplot data=lipid_grp;
  series  x=day y=median / lineattrs=(pattern=solid) group=trt name='s'
          groupdisplay=cluster clusterwidth=0.5 lineattrs=(thickness=2);
