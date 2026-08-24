proc sgscatter data=sashelp.cars;
    label mpg_city='City';
    label mpg_highway='Highway';
    matrix mpg_city mpg_highway horsepower length /
      transparency=0.8 markerattrs=graphdata3(symbol=circlefilled);
run;
