proc sgplot data=SASHelp.Heart;
   vbar Status;
run;
*20-3;
title "Mean Height by Sex";
proc sgplot data=SASHelp.Heart;
   hbar sex / response=Height stat=mean nofill
              barwidth=.25;
run;
