%let dsn = advrpt.demog;
proc print data=&dsn;
  var %varlst(&dsn);
