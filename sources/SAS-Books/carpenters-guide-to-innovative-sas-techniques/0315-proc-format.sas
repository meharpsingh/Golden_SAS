proc format;
  picture durtest(default=27)
    other='%n days %H hours %M minutes'
          (datatype=time);
  run;
 data _null_;
     start = '01jan2010:12:34'dt;
     end = '01feb2010:18:36'dt;
     diff = end - start;
     put diff=durtest.;
     run;
