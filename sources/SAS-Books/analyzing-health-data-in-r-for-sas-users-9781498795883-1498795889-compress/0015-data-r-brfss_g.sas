data r.BRFSS_g;
set r.BRFSS_g;
EDGROUP = 9;
if EDUCA in (1,2,3)
then EDGROUP = 1;
if EDUCA = 4
then EDGROUP = 2;
if EDUCA = 5
then EDGROUP = 3;
if EDUCA = 6
then EDGROUP = 4;
run;
