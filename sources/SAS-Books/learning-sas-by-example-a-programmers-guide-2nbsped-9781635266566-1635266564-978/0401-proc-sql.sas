proc sql;
   create table percentages as
   select Subject,
          RBC,
          WBC,
          mean(RBC) as MeanRBC,
          mean(WBC) as MeanWBC,
          100*RBC / calculated MeanRBC as Percent_RBC,
          100*WBC / calculated MeanWBC as Percent_WBC
   from learn.blood(obs=10);
quit;
title "Listing of PERCENTAGES";
proc print data=percentages;
run;
