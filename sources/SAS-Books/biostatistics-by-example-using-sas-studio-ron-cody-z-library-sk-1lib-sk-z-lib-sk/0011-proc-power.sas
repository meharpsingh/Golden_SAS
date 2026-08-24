proc power;
   onewayanova
   groupmeans = 20 | 25 | 30
   stddev = 8 10
   power = .80 .90
   npergroup = .;
   plot x = power min = .70 max = .90;
run;
