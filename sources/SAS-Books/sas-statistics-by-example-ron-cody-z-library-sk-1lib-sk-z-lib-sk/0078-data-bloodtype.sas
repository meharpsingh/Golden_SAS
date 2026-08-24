data bloodtype;
input Type $ Count @@;
datalines;
O 88 A 76 B 24 AB 12
;
title "Computing Chi-Square for a One-Way Table";
proc freq data=bloodtype;
tables Type / testp = (.40 .04 .11 .45);
weight Count;
run;
