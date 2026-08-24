proc report data=advrpt.demog nowd;
   column edu sex,(wt wt=wtse) wt=n wt=allwt;
   define edu / group 'Years/Ed.';
   define sex / across order=formatted;
   define wt  / mean 'Mean' F=5.1;
   define wtse / stderr 'StdErr' f=5.2;
   define n   / n noprint;
   define allwt / mean 'Overall/Mean' f=5.1;
   compute after/style(lines)={just=center
                               font_face=Arial
                               font_style=italic
                               font_size=10pt};
      line ' ';
      line @10  'Overall Statistics:';
run;
