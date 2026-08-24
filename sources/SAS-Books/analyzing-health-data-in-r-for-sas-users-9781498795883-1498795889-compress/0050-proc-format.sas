proc format;
value asthma_f
0 = "No Asthma"
1 = "Has Asthma";
value alcohol_f
1 = "Nondrinker"
2 = "Monthly Drinker"
3 = "Weekly Drinker"
;
run;
/*apply formats in proc tabulate*/
proc tabulate data=r.example;
title "Continuous Variable Table 1";
format ALCGRP alcohol_f.
       ASTHMA4 asthma_f.;
class ALCGRP ASTHMA4;
var SLEPTIM2;
TABLE ALCGRP ASTHMA4,
       SLEPTIM1 * (N Mean STD);
run;
