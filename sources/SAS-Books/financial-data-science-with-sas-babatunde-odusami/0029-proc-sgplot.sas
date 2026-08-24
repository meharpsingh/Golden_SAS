proc sgplot data=arspx_monthly;
      title 'Automatic Outlier Detection and Correc
      series x=date y=volume_A1 / name="Preadjusted
      markerattrs=(color=red symbol='circle')
      lineattrs=(color=red) legendlabel="Preadjuste
      series x=date y=volume_E1 / name="Adjusted Vo
      markerattrs=(color=blue symbol='asterisk')
      lineattrs=(color=blue) legendlabel= " Outlier
      yaxis label='Original and Outlier Adjusted S&
      keylegend "Preadjusted Volume" "Adjusted Volu
      position=bottomRight location=inside;
run;
title;
