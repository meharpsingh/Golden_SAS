proc sgplot data=QTc_Mean_Group;
  format week qtcmean.;
  format n 3.0;
  scatter x=week y=mean / yerrorupper=high yerrorlower=low
          group=drug groupdisplay=cluster clusterwidth=0.5
          markerattrs=(size=7 symbol=circlefilled) name='a';
