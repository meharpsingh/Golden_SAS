data one;
   input CowName$ DamID CurrSCC CurrMilk LactNum DamSCC DamMilk DamLact;
datalines;
  TRST11    3871716   100   47.1      3       650       .       5
  ZUKR02    3878083   152   54.4      2       162     38.1      5
  GENE01    3924135    62   52.6      3        54     34.4      5
  ANCH01    3933356    38   43.5      1       162     34.4      5
  LXUS01    3933356    41   49.0      2       162     34.4      5
  BUCK01    3953108   141   32.6      2       200     54.4      5
  VIEW10    3953973   162     .       2        29     54.4      5
  DAN15     3973832    87   43.5      2        29     58.0      4
  MONT09    3973868    38   38.1      1       100     47.1      3
  HRDL03    3986622   650   36.3      2       214     49.0      4
  DCLO04    4024311   162   61.7      1      1715     23.5      3
  MONT05    4024314   348   50.8      1        31     56.2      3
  FLAG01  110128090    13   54.4      1        13     68.9      3
  JOUR02  110128317   246   38.1      1        62       .       3
  AVRY12  110128438    81     .       1       746     49.0      3
  BRTA77  110128456   152     .       1      1131     41.7      3
  DCLO01  110409807    22   38.1      1        13     47.1      3
;
proc mixed;
   model currscc = damscc /solution outp=rrr influence;
   estimate 'Heritability' damscc 2;
run;
proc univariate plot normal data=rrr;
 var resid;
run;
