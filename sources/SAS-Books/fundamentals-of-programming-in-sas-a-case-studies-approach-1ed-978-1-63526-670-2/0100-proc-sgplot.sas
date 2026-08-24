ods listing;  3: Bar Chart Basics, Data Diagnostics and Cleaning, and More on Reading Data from Other Sources
proc sgplot data=work.stats;
  hbar  metro / response=median  fillattrs=(color=green)
                 legendlabel='Median'  barwidth=.9 ;
  hbar  metro / response=avg fillattrs=(transparency=0.3  color=orange)
                 outlineattrs=(color=black) legendlabel='Mean' barwidth=.7;
  where metro between 2 and 4;
  format metro metro.;
  xaxis label='Household Income' valuesformat=dollar8.;
  yaxis display=(nolabel);
  keylegend / position=topright across=1 location=inside
              valueattrs=(size=8pt) noborder; run;
