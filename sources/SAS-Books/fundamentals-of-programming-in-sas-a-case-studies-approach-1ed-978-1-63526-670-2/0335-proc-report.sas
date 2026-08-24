proc report data = demo nowd;
  column state gdp pop perCapita;
  define state / group;
  define perCapita / computed format = 4.2;
  compute perCapita;
    perCapita = gdp/pop;
run;
