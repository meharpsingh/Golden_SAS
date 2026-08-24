ods listing style=journal;
proc sgplot data=QTc_Mean_Group;
  styleattrs datasymbols=(circlefilled trianglefilled)
             datalinepatterns=(solid shortdash);
  format week qtcmean.;
  format n 3.0;
  series x=week y=mean2 / group=drug groupdisplay=cluster c
         clusterwidth=0.5;
  scatter x=week y=mean / yerrorupper=high yerrorlower=low
          group=drug name='a' groupdisplay=cluster
          clusterwidth=0.5 markerattrs=(size=7)
          filledoutlinedmarkers markerfillattrs=graphwalls;
  xaxistable n / class=drug colorgroup=drug location=inside
            title='Number of Subjects at Visit' separator;
  refline 26 / axis=x;
