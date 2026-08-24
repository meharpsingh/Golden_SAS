proc power;
   onewayanova
   groupmeans = 50 | 60 | 70
   stddev = 10
   power = .80 .90
   npergroup = .;
   plot x = power min = .70 max = .90;
run;
