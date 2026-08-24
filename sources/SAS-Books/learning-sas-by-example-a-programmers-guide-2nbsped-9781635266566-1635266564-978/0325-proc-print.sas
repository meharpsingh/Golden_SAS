proc print data=Generate noobs;
title "Randomly Generated Data Set with &n Obs";
title2 "Values are Integers from &Start to &End";
run;
  %mend Gen;
