  data Soccer;
input Team : $20. Wins Losses;
  datalines;
  Readington 20 3
  Raritan 10 10
  Branchburg 3 18
  Somerville 5 18
  ;
  options nodate nonumber;
  title;
  ods listing close;
  ods csv file='C:\books\learning\Soccer.csv';
  proc print data=Soccer noobs;
  run;
